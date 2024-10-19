import 'package:belglow_insights/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  final List<double>
      dataPoints; // Ahora los puntos son dinámicos y se pasan como parámetro

  CustomLineChart(
      {required this.dataPoints}); // Recibe los puntos a través del constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom:4), // Padding vertical
      child: AspectRatio(
        aspectRatio:
            1.8, // Cambia la proporción del gráfico (más estrecho y pequeño)
        child: LineChart(
          LineChartData(
            backgroundColor: Colors.white, // Fondo blanco
            gridData: FlGridData(
              show: false, // Mostramos las líneas de la cuadrícula
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval:
                      1, // Aseguramos que las etiquetas estén espaciadas correctamente
                  reservedSize:
                      35, // Aumentamos el espacio reservado para las etiquetas
                  getTitlesWidget: (value, meta) {
                    switch (value.toInt()) {
                      case 0:
                        return Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Sem 1',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        );
                      case 1:
                        return Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Sem 2',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        );
                      case 2:
                        return Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Sem 3',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        );
                      case 3:
                        return Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Sem 4',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        );
                      default:
                        return Container();
                    }
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval:
                      100, // Aseguramos que las etiquetas del eje Y estén espaciadas correctamente
                  reservedSize:
                      40, // Aumentamos el espacio reservado para las etiquetas
                  getTitlesWidget: (value, meta) {
                    switch (value.toInt()) {
                      case 100:
                        return Text(
                          '100',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        );
                      case 200:
                        return Text(
                          '200',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        );
                      case 300:
                        return Text(
                          '300',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        );
                      case 400:
                        return Text(
                          '400',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        );
                      default:
                        return Container();
                    }
                  },
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: Colors.transparent, // Sin bordes visibles
              ),
            ),
            minX: 0, // Ajustamos para que el primer punto comience desde el 0
            maxX: 3, // Ajustamos para que el último punto termine en el 3
            minY: 50, // Añadimos un poco de espacio al inicio del eje Y
            maxY: 300, // Añadimos un poco de espacio al final del eje Y
            clipData: FlClipData
                .none(), // Cambia a FlClipData.none() para evitar que se corte
            lineBarsData: [
              LineChartBarData(
                isCurved: false, // Líneas rectas
                color: const Color.fromARGB(255, 149, 112, 200), // Color de la línea
                barWidth: 3, // Disminuimos el ancho de la línea
                isStrokeCapRound: true,
                dotData: FlDotData(show: true), // Muestra puntos en la línea
                belowBarData: BarAreaData(
                  show: true,
                  color: belPurple
                      .withOpacity(0.3), // Relleno debajo de la línea
                ),
                spots: dataPoints.asMap().entries.map((entry) {
                  return FlSpot(entry.key.toDouble(),
                      entry.value); // Los puntos coinciden con las semanas
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
