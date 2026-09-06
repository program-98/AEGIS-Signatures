# AEGIS Signatures Feed

Repositorio público previsto para distribuir actualizaciones de firmas SHA-256 de AEGIS USB.

## Estructura

- `manifest.json` — versión, URL del paquete, SHA-256 e inventario.
- `hash-database.json` — base de firmas publicada.

## Publicación correcta

1. Revisar las firmas antes de publicar.
2. Generar `hash-database.json`.
3. Calcular SHA-256 del archivo exacto que se va a publicar.
4. Actualizar `manifest.json`.
5. Publicar ambos archivos por HTTPS.
6. En una siguiente fase, firmar digitalmente el manifiesto con una clave privada de publicación y hacer que AEGIS verifique la firma con una clave pública embebida.

> Esta carpeta contiene únicamente las dos firmas de prueba controladas usadas durante el desarrollo. No son firmas de malware real.
