import 'package:belglow_insights/ui/catalog.dart';
import 'package:belglow_insights/ui/home_view.dart';
import 'package:belglow_insights/ui/product_trend_view.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'utils/colors.dart'; 
import 'package:belglow_insights/ui/bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controlador para el estado del Drawer
  bool isDrawerOpen = true;
  
  // Variable para almacenar la opción seleccionada del menú
  String selectedMenu = 'Home';

  // Método para manejar el cambio de sección
  void _onMenuSelected(String menu) {
    setState(() {
      selectedMenu = menu;
    });
  }

  // Método para manejar el clic en las opciones del menú desplegable
  void _onMenuOptionSelected(String option) {
    if (option == 'Perfil') {
      // Navegar a la pantalla de perfil
      print('Ver perfil');
    } else if (option == 'Cerrar sesión') {
      // Lógica para cerrar sesión
      print('Cerrar sesión');
    }
  }

  // Método que cambia la vista según la selección del menú
  Widget _getSelectedView() {
    if (selectedMenu == 'Home') {
      return HomeView(); // Retorna la vista Home
    } else if (selectedMenu == 'Product Trend') {
      return ProductTrendView(); // Retorna la vista Product Trend
    } else {
      return Center(
        child: Text('Selecciona una opción del menú'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none, // Permite que el botón se sobresalga sin ser tapado
        children: [
          Row(
            children: [
              // Menú lateral que cubre todo el lado izquierdo
              AnimatedContainer(
                width: isDrawerOpen ? 250 : 60, // Cambia el ancho según el estado
                duration: Duration(milliseconds: 300), // Animación suave
                child: Container(
                  color: belPurple, // Asegura que tenga un color de fondo para visualizarlo bien
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 16, top: 16, bottom: 8),
                        child: Row(
                          children: [
                            Image.asset(
                              '../assets/images/bel_logo.png', // Ruta a la imagen
                              width: 30, // Ajusta el tamaño de la imagen
                              height: 30,
                            ),
                            if (isDrawerOpen) // Solo mostrar texto si el drawer está abierto
                              SizedBox(width: 9), // Espacio entre la imagen y el texto
                            if (isDrawerOpen)
                              Text(
                                'BelGlow Insights',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0), // Espacio a los lados del Divider
                        child: Divider(color: Colors.white54),
                      ),
                      ListTile(
                        title: isDrawerOpen
                            ? Text('Home', style: TextStyle(color: Colors.white))
                            : null, // Ocultar el texto si el menú está minimizado
                        leading: Icon(Icons.home, color: Colors.white),
                        onTap: () => _onMenuSelected('Home'),
                      ),
                      ListTile(
                        title: isDrawerOpen
                            ? Text('Product Trend', style: TextStyle(color: Colors.white))
                            : null, // Ocultar el texto si el menú está minimizado
                        leading: Icon(Icons.trending_up, color: Colors.white),
                        onTap: () => _onMenuSelected('Product Trend'),
                      ),
                      Spacer(), // Esto empuja el contenido hacia abajo
                    ],
                  ),
                ),
              ),
              // Columna para la Top Bar y el contenido principal
              Expanded(
                child: Column(
                  children: [
                    // Top bar que debe estar alineado a la derecha del menu
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Título de la sección actual
                          Text(
                            selectedMenu,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          // Icono de notificaciones, imagen de perfil y nombre de usuario con flecha desplegable
                          Row(
                            children: [
                              Icon(Icons.notifications, color: Colors.grey[700]),
                              SizedBox(width: 16), // Espacio entre el icono y la imagen
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  'https://m.media-amazon.com/images/I/61l4IFyv0lL._AC_UF894,1000_QL80_.jpg', // Coloca aquí la imagen de perfil
                                ),
                              ),
                              SizedBox(width: 8), // Espacio entre la imagen y el nombre
                              Text(
                                'Chris Shawn Doe',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              SizedBox(width: 1),
                              PopupMenuButton<String>(
                                onSelected: _onMenuOptionSelected,
                                icon: Icon(Icons.arrow_drop_down, color: Colors.grey[700]),
                                itemBuilder: (BuildContext context) {
                                  return ['Perfil', 'Cerrar sesión'].map((String option) {
                                    return PopupMenuItem<String>(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Contenedor central que cambiará de contenido según la selección del menú
                    Expanded(
                      child: Container(
                        color: Colors.grey[200], // Fondo más oscuro del área general
                        padding: EdgeInsets.all(16),
                        child: _getSelectedView(), // Cargar la vista seleccionada
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Botón de minimizar, flotante en la esquina superior derecha, superpuesto y visible
          AnimatedPositioned(
            duration: Duration(milliseconds: 300), // Animación suave
            top: 8,
            left: isDrawerOpen ? 230 : 40, // Ajustar para que quede alineado al borde
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Misma sombra que el menú
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(isDrawerOpen ? Icons.arrow_back : Icons.menu, color: belPurple),
                onPressed: () {
                  setState(() {
                    isDrawerOpen = !isDrawerOpen;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
