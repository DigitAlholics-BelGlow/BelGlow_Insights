import 'package:belglow_insights/ui/bar.dart'; // Asegúrate de tener el archivo correcto
import 'package:belglow_insights/ui/catalog.dart';
import 'package:belglow_insights/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductTrendView extends StatefulWidget {
  @override
  _ProductTrendViewState createState() => _ProductTrendViewState();
}

class _ProductTrendViewState extends State<ProductTrendView> {
  DateTime? _selectedDate;
  // Lista de datos de ejemplo para los productos
  final List<Map<String, dynamic>> productData = [
    {
      "image": "../assets/images/l_bel/Spring/monlbel_2024.png",
      "name": "Monlbel",
      "price": "\$55",
      "totalSales": 220,
      "totalRevenue": "\$12100",
      "salesTrend": [100.4, 115.3, 130.1, 145.6],
      "geoFocus": "Miraflores",
      "percentageChange": 11.47,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/esika/Winter/Azul_Infinito.jpg",
      "name": "Azul Infinito",
      "price": "\$40",
      "totalSales": 300,
      "totalRevenue": "\$12000",
      "salesTrend": [105.0, 115.2, 125.4, 135.7],
      "geoFocus": "Olivos",
      "percentageChange": 10.25,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/Cyzone/Winter/Cyzone_Blue&Blue_Him.jpg",
      "name": "Blue&Blue Him",
      "price": "\$42",
      "totalSales": 390,
      "totalRevenue": "\$16380",
      "salesTrend": [115.0, 125.5, 137.8, 150.9],
      "geoFocus": "San Juan de Miraflores",
      "percentageChange": 13.52,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/esika/Spring/Golden_Vainilla.jpg",
      "name": "Golden Vainilla",
      "price": "\$60",
      "totalSales": 280,
      "totalRevenue": "\$16800",
      "salesTrend": [140.6, 150.8, 160.1, 175.3],
      "geoFocus": "Miraflores",
      "percentageChange": 9.85,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/l_bel/Winter/Devos_Magnetic.jpg",
      "name": "Devos Magnetic",
      "price": "\$65",
      "totalSales": 310,
      "totalRevenue": "\$20150",
      "salesTrend": [145.0, 155.7, 165.4, 180.9],
      "geoFocus": "Magdalena",
      "percentageChange": 11.29,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/esika/Summer/Vibranza.png",
      "name": "Vibranza",
      "price": "\$48",
      "totalSales": 260,
      "totalRevenue": "\$12480",
      "salesTrend": [125.0, 135.3, 145.1, 155.8],
      "geoFocus": "Olivos",
      "percentageChange": 7.98,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/Cyzone/Summer/Cyzone_Ainnara.jpg",
      "name": "Ainnara",
      "price": "\$29",
      "totalSales": 315,
      "totalRevenue": "\$9135",
      "salesTrend": [112.4, 127.5, 139.8, 150.2],
      "geoFocus": "San Juan de Miraflores",
      "percentageChange": 10.25,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/esika/Summer/Red_Rose.jpg",
      "name": "Red Rose",
      "price": "\$33",
      "totalSales": 280,
      "totalRevenue": "\$9240",
      "salesTrend": [105.7, 115.2, 130.8, 140.1],
      "geoFocus": "Miraflores",
      "percentageChange": 9.14,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/l_bel/Summer/Mon_LBel_Rubi.png",
      "name": "Mon LBel Rubi",
      "price": "\$46",
      "totalSales": 350,
      "totalRevenue": "\$16100",
      "salesTrend": [135.0, 145.5, 155.8, 165.4],
      "geoFocus": "Magdalena",
      "percentageChange": 11.78,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/Cyzone/Summer/Cyzone_Blue&Blue_Her.jpg",
      "name": "Blue&Blue Her",
      "price": "\$39",
      "totalSales": 290,
      "totalRevenue": "\$11310",
      "salesTrend": [118.2, 125.0, 135.4, 145.0],
      "geoFocus": "Olivos",
      "percentageChange": 10.56,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/esika/Summer/Vibranza_Addiction.jpg",
      "name": "Vibranza Addiction",
      "price": "\$54",
      "totalSales": 310,
      "totalRevenue": "\$16740",
      "salesTrend": [125.6, 135.2, 145.7, 155.8],
      "geoFocus": "Miraflores",
      "percentageChange": 9.65,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/l_bel/Winter/id.jpg",
      "name": "ID",
      "price": "\$51",
      "totalSales": 375,
      "totalRevenue": "\$19125",
      "salesTrend": [130.0, 142.5, 155.0, 165.5],
      "geoFocus": "Magdalena",
      "percentageChange": 12.53,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/Cyzone/Winter/Cyzone_Sweet_Black_Intense.jpg",
      "name": "Sweet Black Intense",
      "price": "\$45",
      "totalSales": 320,
      "totalRevenue": "\$14400",
      "salesTrend": [110.0, 120.6, 132.4, 145.3],
      "geoFocus": "Olivos",
      "percentageChange": 8.75,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/esika/Winter/DOrsay_Class.jpg",
      "name": "DOrsay Class",
      "price": "\$49",
      "totalSales": 360,
      "totalRevenue": "\$17640",
      "salesTrend": [135.5, 145.6, 155.7, 165.8],
      "geoFocus": "San Juan de Miraflores",
      "percentageChange": 10.89,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/Cyzone/Spring/Cyzone_Nitro.jpg",
      "name": "Nitro",
      "price": "\$37",
      "totalSales": 330,
      "totalRevenue": "\$12210",
      "salesTrend": [120.0, 130.4, 140.8, 150.2],
      "geoFocus": "Miraflores",
      "percentageChange": 9.72,
      "isIncreasing": true
    },
    {
      "image": "../assets/images/l_bel/Summer/Liasson.jpg",
      "name": "Liasson",
      "price": "\$42",
      "totalSales": 300,
      "totalRevenue": "\$12600",
      "salesTrend": [110.0, 125.0, 140.0, 155.0],
      "geoFocus": "Magdalena",
      "percentageChange": 8.54,
      "isIncreasing": true
    }
  ];

  String? _selectedSortOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Fondo similar a la imagen
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Encabezados de la tabla
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showGenerateCatalogDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        belPurple, // Cambia a belPurple si tienes definido ese color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          6), // Esquinas menos redondeadas
                    ),
                  ),
                  child: SizedBox(
                    height: 50, // Ajusta la altura según sea necesario
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Centra el contenido
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Generate Catalog with AI',
                          style: TextStyle(
                            fontSize: 14, // Tamaño de letra más grande
                            fontWeight: FontWeight.bold, // Letra en negrita
                          ),
                        ),
                        SizedBox(width: 8), // Espacio entre texto e imagen
                        Image.asset(
                          'assets/images/ai_icon.png', // Ruta de la imagen en los assets
                          width: 20, // Ajusta el ancho de la imagen
                          height: 20, // Ajusta la altura de la imagen
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Encabezados de la tabla
            Container(
              width: double
                  .infinity, // Aseguramos que el contenedor ocupe el ancho completo
              child: Row(
                children: [
                  _buildHeaderCell('Image', flex: 1),
                  SizedBox(width: 10),
                  _buildHeaderCell('Product'),
                  SizedBox(width: 10),
                  _buildHeaderCell('Total Revenue'),
                  SizedBox(width: 10),
                  _buildHeaderCellWithInfo(context, 'Month Tendency', flex: 3),
                  SizedBox(width: 10),
                  _buildHeaderCell('Demand Zone'),
                  SizedBox(width: 10),
                  _buildHeaderCell('Profitability %'),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: productData.length,
                itemBuilder: (context, index) {
                  final product = productData[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildTableCell(
                        content: _buildImageCell(product['image']),
                        isTopRow: index == 0,
                        isBottomRow: index == productData.length - 1,
                        flex: 1,
                      ),
                      SizedBox(width: 10),
                      _buildTableCell(
                        content: Text(
                          product['name'],
                          style:
                              TextStyle(color: Color(0xFF666666), fontSize: 16),
                        ),
                        isTopRow: index == 0,
                        isBottomRow: index == productData.length - 1,
                      ),
                      SizedBox(width: 10),
                      _buildTableCell(
                        content: Text(
                          product['totalRevenue'],
                          style:
                              TextStyle(color: Color(0xFF666666), fontSize: 16),
                        ),
                        isTopRow: index == 0,
                        isBottomRow: index == productData.length - 1,
                      ),
                      SizedBox(width: 10),
                      _buildTableCell(
                        content:
                            CustomLineChart(dataPoints: product['salesTrend']),
                        isTopRow: index == 0,
                        isBottomRow: index == productData.length - 1,
                        flex: 3,
                      ),
                      SizedBox(width: 10),
                      _buildTableCell(
                        content: Text(
                          product['geoFocus'],
                          style:
                              TextStyle(color: Color(0xFF666666), fontSize: 16),
                        ),
                        isTopRow: index == 0,
                        isBottomRow: index == productData.length - 1,
                      ),
                      SizedBox(width: 10),
                      _buildTableCell(
                        content: _buildPercentageCell(
                            product['percentageChange'],
                            product['isIncreasing']),
                        isTopRow: index == 0,
                        isBottomRow: index == productData.length - 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para crear las celdas del encabezado con ícono de información
  Widget _buildHeaderCellWithInfo(BuildContext context, String title,
      {int flex = 2}) {
    return Flexible(
      flex: flex,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[400]!),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: IconButton(
                icon: Icon(Icons.info_outline, color: belPurple),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Information'),
                        content: Text(
                            'The graph presents the number of units sold per week of the month.'),
                        actions: [
                          TextButton(
                            child: Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Método para crear las celdas del encabezado con esquinas redondeadas
  Widget _buildHeaderCell(String title, {int flex = 2}) {
    return Flexible(
      flex: flex,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[400]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  // Método para crear las celdas de datos con bordes y redondeo condicional
  Widget _buildTableCell({
    required Widget content,
    bool isTopRow = false,
    bool isBottomRow = false,
    int flex = 2,
  }) {
    return Flexible(
      flex: flex,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: isTopRow ? Radius.circular(8) : Radius.zero,
            topRight: isTopRow ? Radius.circular(8) : Radius.zero,
            bottomLeft: isBottomRow ? Radius.circular(8) : Radius.zero,
            bottomRight: isBottomRow ? Radius.circular(8) : Radius.zero,
          ),
          border: Border(
            top: isTopRow
                ? BorderSide(color: Colors.grey[400]!)
                : BorderSide.none,
            left: BorderSide(color: Colors.grey[400]!),
            right: BorderSide(color: Colors.grey[400]!),
            bottom: BorderSide(color: Colors.grey[400]!),
          ),
        ),
        child: Center(child: content),
      ),
    );
  }

  // Método para crear la celda de imagen del producto
  Widget _buildImageCell(String imagePath) {
    return Image.asset(
      imagePath,
      width: 80,
      height: 80,
      fit: BoxFit.cover,
    );
  }

  // Método para crear la celda de cambio porcentual
  Widget _buildPercentageCell(double percentage, bool isIncreasing) {
    return Container(
      width: 120,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isIncreasing ? Color(0xFFE0F7FA) : Color(0xFFFFEBEE),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: isIncreasing
                ? const Color.fromARGB(255, 74, 255, 169)
                : Colors.red),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isIncreasing ? Icons.arrow_upward : Icons.arrow_downward,
            color: isIncreasing
                ? const Color.fromARGB(255, 74, 255, 169)
                : const Color.fromARGB(255, 255, 87, 121),
          ),
          SizedBox(width: 5),
          Text(
            '${percentage.toStringAsFixed(2)}%',
            style: TextStyle(
              color: Color(0xFF666666),
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // Método para mostrar el cuadro de diálogo para generar el catálogo
  void _showGenerateCatalogDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Generate Catalog of Trend Products with AI'),
                  SizedBox(height: 8),
                  Divider(color: Colors.grey), // Divider debajo del título
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Círculo con el número 1 y texto
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.purple[100], // Fondo morado claro
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: belPurple, width: 2), // Borde morado
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: belPurple, // Color del número morado
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8), // Espacio entre círculo y texto
                      Text(
                        'Choose the start date of the campaign:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Selector de fecha con texto
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _selectDate(context, setState);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              belPurple, // Cambia a belPurple si tienes definido ese color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                4), // Esquinas menos redondeadas
                          ),
                        ),
                        child: Text(
                          'Select Date',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      if (_selectedDate != null) ...[
                        SizedBox(width: 8),
                        Text(
                          '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                          style: TextStyle(fontSize: 14, color: belPurple),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PerfumeShopView(),
                      ),
                    ); // Cierra el diálogo
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        belPurple, // Cambia a belPurple si tienes definido ese color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4), // Menos redondeo
                    ),
                  ),
                  child: Text(
                    'Create',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Método para seleccionar la fecha
  Future<void> _selectDate(BuildContext context, StateSetter setState) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
