import 'package:flutter/material.dart';

class OrganizationProfileView extends StatelessWidget {
  const OrganizationProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 440.0), // Ajusta según sea necesario
              child: const Row(
                children: [
                  Text(
                    'Volver',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  Text(
                    '  /  Resumen  /  Mis Módulos  /  Perfil Básico Organizacional',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 440.0), // Ajusta según sea necesario
              child: const Text(
                'Perfil Básico Organizacional',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 440.0), // Ajusta según sea necesario
            child: Row(
              children: [
                _buildProgressCard(
                    'Componentes completados', '3 de 3', 1.0, context),
                const SizedBox(width: 7),
                _buildProgressCard(
                    'Criterios completados', '13 de 13', 1.0, context),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 440.0), // Ajusta según sea necesario
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contenido',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '3 Componentes · # Criterios',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150.0), // Ajusta según sea necesario
            child: Column(
              children: [
                _buildContentCard('Información general', '3 Criterios'),
                _buildContentCard('Estado de la organización', '3 Criterios'),
                _buildContentCard('Participación en el ecosistema', '7 Criterios'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(
      String title, String progress, double value, BuildContext context) {
    return Container(
      width: 300, // Fijo el ancho a 300 para que coincida con el ancho de las tarjetas de contenido
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            progress,
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.grey,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildContentCard(String title, String criteria) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      width: 600, // Ajustado el ancho a 600
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pendiente',
                style: TextStyle(
                    color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          Text(
            criteria,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}