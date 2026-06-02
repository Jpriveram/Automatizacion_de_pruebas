# Automatizacion de pruebas - Demoblaze

Este proyecto contiene pruebas automatizadas para la pagina
[Demoblaze](https://www.demoblaze.com/) utilizando Ruby, Cucumber, Capybara y
Selenium WebDriver con Google Chrome.

El objetivo principal es validar funcionalidades clave de la aplicacion mediante
escenarios BDD escritos en Gherkin y ejecutados contra la interfaz web real.

## Stack utilizado

- Ruby
- Cucumber
- Capybara
- Selenium WebDriver
- Google Chrome / ChromeDriver

## Configuracion principal

La configuracion de Capybara y Selenium se encuentra en:

```text
features/support/env.rb
```

Alli se define el host de pruebas:

```ruby
Capybara.app_host = "https://www.demoblaze.com"
```

Tambien se registra Selenium como driver para Chrome:

```ruby
Capybara.default_driver = :selenium
CapybaraDriverRegistrar.register_selenium_driver(:chrome)
```

Los hooks se encuentran en:

```text
features/support/hooks.rb
```

El hook principal cierra el navegador despues de cada escenario:

```ruby
After do
  Capybara.current_session.driver.quit
end
```

## Modulos automatizados

### Contact

Archivo:

```text
features/Contact.feature
```

Valida la funcionalidad del modal de contacto:

- Apertura del modal `Contact`.
- Cierre del modal con `x`.
- Cierre del modal con `Close`.
- Envio del formulario de contacto.
- Validacion del alert `Thanks for the message!!`.

### Login

Archivo:

```text
features/Login.feature
```

Valida la funcionalidad de inicio de sesion:

- Apertura del modal `Log in`.
- Cierre del modal.
- Validacion de formulario vacio.
- Login exitoso con credenciales validas.
- Confirmacion del mensaje `Welcome test`.

### Logout

Archivo:

```text
features/Logout.feature
```

Valida el cierre de sesion:

- Login previo del usuario.
- Clic en `Log out`.
- Validacion de que desaparece `Welcome test`.
- Confirmacion de que vuelve a mostrarse `Log in`.

### Sign up

Archivo:

```text
features/Signup.feature
```

Valida el registro de nuevos usuarios:

- Apertura del modal `Sign up`.
- Cierre del modal con `x`.
- Cierre del modal con `Close`.
- Validacion de formulario vacio.
- Registro exitoso con usuario unico.

Los datos del registro se llenan desde:

```text
features/step_definitions/SignupSteps.rb
```

El username se genera de forma dinamica para evitar usuarios repetidos:

```ruby
unique_username = "#{data['Username']}_#{Time.now.to_i}_#{rand(1000)}"
```

### Product Detail

Archivo:

```text
features/ProductDetail.feature
```

Valida la pagina de detalle de productos:

- Apertura del detalle desde la pagina principal.
- Validacion del nombre del producto.
- Validacion del precio.
- Validacion de la descripcion.
- Validacion del boton `Add to cart`.
- Uso de `Scenario Outline` para probar varios productos.

### Footer

Archivo:

```text
features/Footer.feature
```

Valida que el footer se muestre correctamente en paginas principales:

- Home.
- Product detail.
- Cart.

Se valida la presencia de secciones como:

- `About Us`.
- `Get in Touch`.
- `PRODUCT STORE`.

## Estructura general

```text
features/
  Contact.feature
  Login.feature
  Logout.feature
  Signup.feature
  ProductDetail.feature
  Footer.feature
  step_definitions/
    ContactSteps.rb
    LoginSteps.rb
    LogoutSteps.rb
    SignupSteps.rb
    ProductDetailSteps.rb
    FooterSteps.rb
  support/
    env.rb
    hooks.rb
```

## Ejecutar todos los tests

Desde la raiz del proyecto:

```powershell
cucumber
```

Tambien se puede ejecutar explicitamente la carpeta `features`:

```powershell
cucumber features
```

## Ejecutar tests por modulo

### Contact

```powershell
cucumber features\Contact.feature
```

### Login

```powershell
cucumber features\Login.feature
```

### Logout

```powershell
cucumber features\Logout.feature
```

### Sign up

```powershell
cucumber features\Signup.feature
```

Ejecutar solo los escenarios de Sign up que no crean usuarios:

```powershell
cucumber features\Signup.feature --tags "not @positive"
```

Ejecutar solo el escenario de registro exitoso:

```powershell
cucumber features\Signup.feature:35
```

### Product Detail

```powershell
cucumber features\ProductDetail.feature
```

Ejecutar solo el `Scenario Outline` de productos:

```powershell
cucumber features\ProductDetail.feature:18
```

### Footer

```powershell
cucumber features\Footer.feature
```

## Ejecutar por tags

Algunos escenarios tienen tags para facilitar su ejecucion.

Ejemplo:

```powershell
cucumber --tags @signup
```

```powershell
cucumber --tags @footer
```

```powershell
cucumber --tags @product_detail
```

## Generar reporte HTML

Para generar un reporte en HTML:

```powershell
cucumber features --format html --out reports/reporte.html
```

El reporte se guardara en:

```text
reports/reporte.html
```

## Buenas practicas aplicadas

- Uso de escenarios expresivos en Gherkin.
- Uso de `Background` para pasos comunes.
- Uso de `Scenario Outline` para reutilizar escenarios con varios datos.
- Uso de tablas para organizar datos de entrada y validaciones.
- Reutilizacion de steps comunes.
- Uso de selectores CSS estables cuando existen IDs o clases claras.
- Evitar XPath completo cuando el elemento puede ubicarse por texto, ID o CSS selector.
- Cierre del navegador despues de cada escenario mediante hooks.

## Notas

Las pruebas se ejecutan sobre una pagina publica. Algunos escenarios, como el
registro exitoso de `Sign up`, crean usuarios en Demoblaze. Por esa razon, el
username se genera de forma unica en cada ejecucion.
