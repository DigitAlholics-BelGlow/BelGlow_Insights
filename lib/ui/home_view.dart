import 'package:belglow_insights/ui/catalog.dart';
import 'package:belglow_insights/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título "Your total revenue"
            Text(
              'Your total revenue',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            // Total revenue
            Text(
              '\$90,239.00',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: <Color>[Colors.purple, Colors.orange],
                  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
              ),
            ),
            SizedBox(height: 20),
            // Paneles de métricas
            Row(
              children: [
                _buildMetricCard(
                  title: 'New consultants',
                  value: '22',
                  percentage: 15,
                  isIncrease: true,
                  color: Colors.purple,
                ),
                SizedBox(width: 10),
                _buildMetricCard(
                  title: 'New orders',
                  value: '320',
                  percentage: -4,
                  isIncrease: false,
                  color: Colors.orange,
                ),
                SizedBox(width: 10),
                _buildMetricCard(
                  title: 'Avg. order revenue',
                  value: '\$1,080',
                  percentage: 8,
                  isIncrease: true,
                  color: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 30),
            // Título "Recent catalogs created"
            Text(
              'Recent catalogs created',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Pestañas para "Draft", "Sended"
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTab(title: 'Count', count: 1),
              ],
            ),
            SizedBox(height: 16),
            // Tarjeta de "Catalog generated" a la izquierda
            _buildCatalogCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required int percentage,
    required bool isIncrease,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  isIncrease ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isIncrease ? Colors.green : Colors.red,
                  size: 16,
                ),
                Text(
                  '$percentage%',
                  style: TextStyle(
                    color: isIncrease ? Colors.green : Colors.red,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'compared to last week',
              style: TextStyle(color: Colors.black45, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab({required String title, required int count}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(width: 4),
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.grey[200],
            child: Text(
              count.toString(),
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  // Nueva tarjeta "Catalog generated"
  Widget _buildCatalogCard() {
    return Container(
      width: 300, // Ajusta el ancho de la tarjeta
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título y ícono de catálogo
          Row(
            children: [
              Icon(Icons.book, color: belPurple, size: 28),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Catalog generated - 19/10/2024',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(color: Colors.grey[300]),
          SizedBox(height: 8),
          // Detalles
          Text(
            'Lima, Peru',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Campaign: 28/10/2024',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Profits Prediction: \$456,321',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 16),
          Divider(color: Colors.grey[300]),
          SizedBox(height: 8),
          // Botón de acción
          ElevatedButton(
            onPressed: () {
               Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PerfumeShopView(),
                          ),
                        );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: belPurple,
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'View',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
