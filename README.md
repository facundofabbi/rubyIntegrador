# Ruby Banco

Ruby Banco es una aplicación desarrollada con [Ruby on Rails 7] como trabajo integrador de la cursada 2022 de la materia Taller de Tecnologías de Producción de Software - Opción Ruby, de la Facultad de Informática, Universidad Nacional de La Plata.

# Frontend

El frontend, desarrollado utilizando bootstrap

# Backend

El backend fue desarrollado utilizando Ruby on Rails 7 y, MySQL como gestor de bases de datos.

# Instalación

## Instalación con MySql

## Requerimientos

* Ruby >= 2.7.0

  ### Instalación de ruby 2.7.2 utilizando [rbenv](https://github.com/rbenv/rbenv)
  ```bash
  $ apt update -qq
  $ apt install -y git \
        build-essential \
        autoconf \
        bison \
        curl \
        lib{ssl,yaml,sqlite3}-dev \
        libreadline{8,-dev} \
        zlib1g{,-dev}


  $ git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  $ cd ~/.rbenv && src/configure && make -C src
  $ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  $ echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  $ exec $SHELL -l
  $ git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins /ruby-build
  $ rbenv install 2.7.2
  $ rbenv global 2.7.2
  ```
  Puede comprobar la versión de Ruby instalada:
  ```bash
  $ ruby --version
  ruby 2.7.2p137 (2022-12-07 revision 5445e04352) [x86_64-linux]
  ```

* RubyGems >= 3.3

  ### [Actualizar rubygems](https://rubygems.org/pages/download)

  ```bash
  $ gem update --system
  ```
  
* MySQL
  ### Instalación

  ```bash
  $ sudo apt update
  $ sudo apt install mysql-server	
  ```

  ### Configuración

  ```bash
  $ sudo mysql_secure_installation
  ```

* Bundler (Instrucciones a continuación)

Una vez instalados Ruby y MySql
### Descargar código fuente:
* [Repositorio Github](https://github.com/facundofabbi/rubyIntegrador)
* O desde la consola, clonar el repositorio:

  ```bash
  $ git clone https://github.com/facundofabbi/rubyIntegrador
  ```
  * En caso de no contar con git instalado, instalar con:
  ```bash
  $ sudo apt-get install git
  ```
  
### Gemas:
* Bundler:
  ```bash
  $ gem install bundler
  ```
* Rails 

  Ubicarse sobre el directorio donde se clonó/descargó el repositorio.

  ```bash
  $ cd rubyIntegrador
  ```

  ```bash
  $ bundle install
  ```
  
### Preparar base de datos:

Si desea crear la base de datos y cargar los datos contenidos en el seed:

```bash
$ rails db:create db:migrate
$ rails db:seed
```



# Iniciar web server

Para iniciar el web server:
```bash
$ rails s
```

### ¡Listo!
El servidor se encontrará funcionando en [http://localhost:3000](http://localhost:3000)


# Decisiones de diseño

## Control de acceso
- Para controlar el acceso a las diferentes rutas y acciones que pueden realizar los distintos roles se utilizó la gema CANCANCAN

- Los usuarios autenticados solo pueden acceder a sus propias Turnos y sus datos.
