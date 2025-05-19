import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Fondo de pantalla con imagen de red
            Positioned.fill(
              child: Image.network(
                'https://raw.githubusercontent.com/Jose-Bonilla-1043/Imagenes_UIII/refs/heads/main/image.png',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            // Contenido
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Campo de usuario
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(245, 245, 245, 0.9),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                            hintText: 'Enter username',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.person_outline, color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Campo de contraseña
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(245, 245, 245, 0.9),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Botón Login
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4285F4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Olvidé contraseña
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forget your password?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                      // Espacio aumentado a 150
                      const SizedBox(height: 150),
                      // Sección inferior agrupada
                      Column(
                        children: [
                          // Divisor "or connect with"
                          Row(
                            children: [
                              const Expanded(
                                child: Divider(
                                  color: Color.fromARGB(255, 114, 107, 107),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'or connect with',
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Divider(
                                  color: Color.fromARGB(255, 114, 107, 107),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 35),
                          // Botones sociales
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSocialButton(
                                color: const Color(0xFF3B5998),
                                icon: Icons.facebook,
                                label: 'Facebook',
                                showText: true,
                              ),
                              const SizedBox(width: 30),
                              _buildSocialButton(
                                color: const Color(0xFF1DA1F2),
                                icon: Icons.circle,
                                label: 'Twitter',
                                showText: true,
                              ),
                            ],
                          ),
                          const SizedBox(height: 45),
                          // Texto de registro
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                                  fontSize: 14,
                                ),
                                children: const [
                                  TextSpan(
                                    text: 'Sign up',
                                    style: TextStyle(
                                      color: Color(0xFF4285F4),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required Color color,
    required IconData icon,
    required String label,
    bool showText = false,
  }) {
    return showText
        ? ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            icon: Icon(icon, color: Colors.white),
            label: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          )
        : Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          );
  }
}
