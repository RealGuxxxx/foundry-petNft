# PetNft 合约

## 简介
`PetNft` 是一个基于以太坊的 ERC721 NFT 合约，允许用户铸造宠物 NFT（狗或猫）。每个 NFT 都有一个独特的图像和元数据，用户可以通过合约中的功能来铸造和管理他们的宠物。

## 合约功能

### 1. 枚举类型
- `Pet`: 定义了宠物的类型，包括 `DOG` 和 `CAT`。

### 2. 状态变量
- `s_dogSvg`: 存储狗的 SVG 图像。
- `s_catSvg`: 存储猫的 SVG 图像。
- `s_tokenCounter`: 用于跟踪铸造的 NFT 数量。
- `s_tokenIdToPet`: 映射每个 tokenId 到其对应的宠物类型。

### 3. 构造函数
```solidity
constructor(string memory dogSvg, string memory catSvg) ERC721("PetNft", "PET")
```
- 初始化合约，设置狗和猫的 SVG 图像，并将 tokenCounter 设置为 0。

### 4. 函数

#### `mintNft()`
- 功能：铸造新的宠物 NFT，默认类型为狗。
- 访问权限：公开。

#### `tokenURI(uint256 tokenId)`
- 功能：返回指定 tokenId 的元数据，包括名称、描述和图像。
- 访问权限：公开。

#### `_baseURI()`
- 功能：返回基础 URI，用于生成 token 的元数据。
- 访问权限：内部。

#### `flipPet(uint256 tokenId)`
- 功能：切换指定 tokenId 的宠物类型（狗与猫之间切换）。
- 访问权限：公开。
- 错误处理：如果调用者不是 NFT 的拥有者或未被授权，则会抛出 `PetNft__CantFlipPetIfNotOwner` 错误。

#### `_isApprovedOrOwner(address spender, uint256 tokenId)`
- 功能：检查指定地址是否为 token 的拥有者或被授权者。
- 访问权限：内部。

## 使用说明
1. 部署合约时，提供狗和猫的 SVG 图像字符串。
2. 调用 `mintNft()` 函数铸造新的宠物 NFT。
3. 使用 `tokenURI(tokenId)` 函数获取 NFT 的元数据。
4. 调用 `flipPet(tokenId)` 函数切换宠物类型。

## 许可证
本合约遵循 MIT 许可证。
