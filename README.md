# ChocoToken: The Token of Joy

ChocoToken: upgradable ERC-20 + Metatx EIP-2771 smart contract implementation.

## Historia

Durante la creación del proyecto [MINE](https://github.com/GOF-EDV/mine), en un momento dado perdimos la fe en el proyecto porque llegamos a pensar que no tenía mucho sentido la parte conceptual respecto a la ventajas de la Blockchain vs las aplicaciones actuales de la Web 2.0 y la complejidad de los asuntos legales implicados en el traspaso de bienes. Faltando 48 horas para entregar el White Paper del proyecto, a Javier García ([@stratoff_](https://twitter.com/stratoff_)) se le ocurrió la idea de desarrollar el ChokoCoin: un Token ERC-20 respaldado por el precio del [Chocoramo](https://unimarket.ca/products/chocoramo-unit), un ponqué muy popular en Colombia.

Aunque inicialmente se denominó [ChocoCoin](https://coinmarketcap.com/es/currencies/chococoin/), luego nos dimos cuenta que [ya existe una criptomoneda](https://www.advfn.com/crypto/Chococoin-CCC/overview) con ese nombre. Por eso le cambiamos el nombre a ChocoToken.

Luego el tema de desarrollar el ERC-20 quedó en pausa ya que no queríamos que se transformara en una shit-token, hasta que nos encontramos en la DevCon 6 Bogota 2022. Allí nos dimos cuenta que al hablar del proyecto, la gente normalmente se reía mucho. Decidimos entonces nombrar el ChocoToken como `el Token de la Alegria` (`The Token of Joy`), y decidimos emprender el proyecto.

![Chocotoken-Devcon6](https://github.com/tomkat-cr/chocotoken/blob/main/images/2022-10-22-Chocotoken-Devcon6-IMG_4466.jpg)

## ¿Cómo ejecutar este código?

1.- Clonar o descargar el repositorio:

```bash
git clone https://github.com/tomkat-cr/chocotoken.git
```

2.- Cambiarse al directorio:

```bash
cd chocotoken
```

3.- Ejecutar el comando:

```bash
npm install
```

## Configuración

Para configurar los parametros:

1.- GOERLI_RPC_URL: será necesario crear una cuenta en [Infura](https://www.infura.io), [Alchemy](https://www.alchemy.com) u otro Web3 Development Platform.

2.- PRIVATE_KEY: será necesario crear una Wallet y obtener su llave privada, por ejemplo en [metamask](https://metamask.io)

3.- ETHERSCAN_KEY: será necesario crear una cuenta en [Etherscan](https://etherscan.io) y una API Key en [My API Keys](https://etherscan.io/myapikey)

Luego:

4.- Crear el archivo .env copiando desde el modelo con el comando:

```bash
cp .env.example .env
```

5.- Asignar los valores a los parámetros en el archivo .env:

```bash
vi .env
```

## Test

Para ejecutar las pruebas:

1.- Ejecute el nodo local:

```bash
npm run node
```

o

```bash
npx hardhat node
```

2.- Ejecutar los tests:

```bash
npm run test
```

o

```bash
npx hardhat test
```

## Deploy del contrato

1.- Para hacer el deploy en la Testnet Goerli, usar el comando:

```bash
npm run deploy
```

1.- Para hacer el deploy en la Testnet Local, usar el comando:

```bash
npm run dev:deploy
```
