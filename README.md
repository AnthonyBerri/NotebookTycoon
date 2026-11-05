Guia detalhado para configuração e execução do projeto de desenvolvimento do jogo em ambiente local.

---

## 👥 Integrantes do Projeto

- **Anthony Felix Berri**
- **Felipe Petri**
- **Leonardo Lamin**
- **Marcos Antonio Martins**

**Turma:** `T2ESOFT04NA`

---

## 📋 Pré-requisitos

Antes de iniciar, certifique-se de ter o seguinte software baixado:

* **Godot Engine 4.x** (versão 4.7 ou a mais recente da linha 4.x):
  * Download oficial: [godotengine.org/pt-br](https://godotengine.org/pt-br/)

---

## 🚀 Passo a Passo para Configuração

1. **Obter o Código-Fonte:**
   * Baixe o arquivo compactado do código-fonte anexado ao projeto.
   * Extraia o conteúdo compactado em uma pasta de sua preferência no seu computador.

2. **Instalação do Godot:**
   * Baixe a versão compatível com seu sistema operacional (ex.: `Godot_v4.7.X-stable_win64.exe` para Windows 64-bit).
   * O Godot é executável diretamente (não requer instalação complexa).

3. **Importar o Projeto no Godot:**
   * Abra o executável do Godot.
   * No painel inicial (Gerenciador de Projetos), clique no botão **"Importar"** localizado no canto superior esquerdo (logo abaixo da logo da Godot).
   * Clique em **"Navegar"** e selecione a pasta onde os arquivos do código-fonte foram extraídos (onde se encontra o arquivo `project.godot`).
   * Confirme clicando em **"Importar & Editar"**.

---

## 🎮 Estrutura de Cenas e Execução

As principais cenas do jogo estão organizadas dentro do diretório `/Scenes`:

| **Menu Inicial** | `Scenes/Menu.tscn` | Tela inicial de apresentação e início do jogo. |
| **Jogo Principal** | `Scenes/Main.tscn` | Cena central onde decorre a jogabilidade principal. |

> **Dica:** Para testar diretamente a partir da tela inicial, selecione a cena `Menu` e pressione `F6` (ou clique no ícone "Executar Cena Atual" no canto superior direito do editor).
