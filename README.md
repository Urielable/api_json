# Repositorio de ejemplos.

Para poder ver el resultado final de cada parte del desarrollo de la api se crearon los siguientes tags:

- `api_post_primera_parte`
- `api_post_segunda_parte`

Para moverse entre tags y ver el repositorio que quieres, solo es necesario cambiarse entre tags con el siguiente comando:

```bash
$ git tag el_tag_que_busco
```

### api_json

Para arrancar tu app:

  1. Instalar dependencias con `mix deps.get`
  2. Crear y migrar tu base de datos con `mix ecto.create && mix ecto.migrate`
  3. Arranca tu app `iex -S mix phoenix.server`

Visita [`localhost:4000`](http://localhost:4000) en tu navegador preferido.

Saludos.