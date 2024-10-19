import 'package:belglow_insights/main.dart';
import 'package:belglow_insights/utils/colors.dart';
import 'package:flutter/material.dart';

class PerfumeShopView extends StatefulWidget {
  @override
  _PerfumeShopViewState createState() => _PerfumeShopViewState();
}

class _PerfumeShopViewState extends State<PerfumeShopView> {
  final List<Map<String, dynamic>> perfumes = [
    {
      'name': 'Monlbel',
      'earning': 12100.00,
      'price': 55.00,
      'image': '../assets/images/l_bel/Spring/monlbel_2024.png',
    },
    {
      'name': 'Azul Infinito',
      'earning': 12000.00,
      'price': 40.00,
      'image': '../assets/images/esika/Winter/Azul_Infinito.jpg',
    },
    {
      'name': 'Blue&Blue Him',
      'earning': 16380.00,
      'price': 42.00,
      'image': '../assets/images/Cyzone/Winter/Cyzone_Blue&Blue_Him.jpg',
    },
    {
      'name': 'Golden Vainilla',
      'earning': 16800.00,
      'price': 60.00,
      'image': '../assets/images/esika/Spring/Golden_Vainilla.jpg',
    },
    {
      'name': 'Devos Magnetic',
      'earning': 20150.00,
      'price': 65.00,
      'image': '../assets/images/l_bel/Winter/Devos_Magnetic.jpg',
    },
    {
      'name': 'Vibranza',
      'earning': 12480.00,
      'price': 48.00,
      'image': '../assets/images/esika/Summer/Vibranza.png',
    },
    {
      'name': 'Ainnara',
      'earning': 9135.00,
      'price': 29.00,
      'image': '../assets/images/Cyzone/Summer/Cyzone_Ainnara.jpg',
    },
    {
      'name': 'Red Rose',
      'earning': 9240.00,
      'price': 33.00,
      'image': '../assets/images/esika/Summer/Red_Rose.jpg',
    },
    {
      'name': 'Mon LBel Rubi',
      'earning': 16100.00,
      'price': 46.00,
      'image': '../assets/images/l_bel/Summer/Mon_LBel_Rubi.png',
    },
    {
      'name': 'Vibranza Addiction',
      'earning': 16740.00,
      'price': 54.00,
      'image': '../assets/images/esika/Summer/Vibranza_Addiction.jpg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        title: Text(
          'Catalog of trend products for May 29, 2021 - Lima Peru',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Texto de Predicción de ganancias con degradado en la cifra
            Center(
              child: _buildEarningsPredictionText(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // 5 tarjetas por fila
                  crossAxisSpacing: 10, // Espacio horizontal entre tarjetas
                  mainAxisSpacing: 10, // Espacio vertical entre tarjetas
                ),
                itemCount: perfumes.length,
                itemBuilder: (context, index) {
                  final perfume = perfumes[index];
                  return _buildPerfumeCard(perfume);
                },
              ),
            ),
            SizedBox(height: 20), // Espacio entre las tarjetas y el botón
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Acción para enviar el catálogo a consultoras
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: belPurple, // Color morado
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize:
                      MainAxisSize.min, // Ajusta al tamaño mínimo necesario
                  children: [
                    Text(
                      'Send catalog to consultants',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8), // Espacio entre texto e ícono
                    Icon(Icons.send, color: Colors.white), // Ícono a la derecha
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para mostrar el texto de predicción con degradado en la cifra
  Widget _buildEarningsPredictionText() {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center, // Centra la fila en la columna
      children: [
        Text(
          'Profit prediction: ',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.purple, Colors.pink, Colors.orange],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds),
          child: Text(
            'S/. 95421',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Color base para aplicar el degradado
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPerfumeCard(Map<String, dynamic> perfume) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  // Acción para cerrar la card o hacer algo
                },
                child: Icon(Icons.close, color: Colors.white),
              ),
            ),
            Image.asset(
              perfume['image'],
              width: 80,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              perfume['name'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              'Earnings: S/ ${perfume['earning'].toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 14,
                color: const Color.fromARGB(255, 30, 205, 65),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Acción para añadir al carrito
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Price: S/ ${perfume['price'].toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
