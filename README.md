# ChocoToken, The Token of Joy

ChocoToken ERC-20 smart contract implementation.

## Historia

Durante la creación del proyecto [MINE](https://github.com/tomkat-cr/mine), en un momento dado perdimos la fe en el proyecto porque llegamos a pensar que no tenía mucho sentido la parte conceptual respecto a la ventajas de la blockchain vs las aplicaciones actuales de la Web 2.0 y la complejidad de los asuntos legales implicados en el traspaso de bienes. Faltando 48 horas para entregar el White Paper del proyecto, surgió la idea de desarrollar el ChokoToken: un Token ERC-20 respaldado por el precio del [Chocoramo](https://unimarket.ca/products/chocoramo-unit), un ponqué muy popular en Colombia.

Inicialmente le llamamos [ChocoCoin](https://coinmarketcap.com/es/currencies/chococoin/), pero [ya existe una criptomoneda](https://www.advfn.com/crypto/Chococoin-CCC/overview) con ese nombre.

Luego el tema de desarrollar el ERC-20 quedó en pausa ya que no queríamos que se transformara en una shit-token, hasta que nos encontramos en la DevCon 6 Bogota 2022. Allí nos dimos cuenta que al hablar del proyecto, la gente normalmente se reía mucho. Decidimos entonces nombrar el ChocoToken como `el Token de la Alegria` (`The Token of Joy`), y decidimos emprender el proyecto.

![Chocotoken-Devcon6](https://github.com/tomkat-cr/chocotoken/blob/main/2022-10-22-Chocotoken-Devcon6-IMG_4466.jpg)

## ¿Cómo ejecutar este código?

1. Clonar o descargar el repositorio: `git clone https://github.com/tomkat-cr/chocotoken.git`.
2. Cambiarse al directorio: `cd chocotoken`.
3. Ejecutar el comando `npm install`.

## Configuración

Para configurar los parametros:

1. GOERLI_RPC_URL: será necesario crear una cuenta en [Infura](https://www.infura.io), [Alchemy](https://www.alchemy.com) u otro Web3 Development Platform.
2. PRIVATE_KEY: será necesario crear una Wallet y obtener su llave privada, por ejemplo en [metamask](https://metamask.io)
3. ETHERSCAN_KEY: será necesario crear una cuenta en [Etherscan](https://etherscan.io) y una API Key en [My API Keys](https://etherscan.io/myapikey)

Luego:

- Crear el archivo .env copiando desde el modelo con el comando `cp .env.example .env`.
- Asignar los valores a los parámetros en el archivo .env `vi .env`.

## Test

Para ejecutar las pruebas:

1. Ejecute el nodo local `npm run node` o `npx hardhat node`
2. Use el comando `npm run test` o `npx hardhat test` para ejecutar los tests.

## Deploy del contrato

- Usar el comando `npm run deploy`.
