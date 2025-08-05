@echo off
echo Criando estrutura de pastas do Portfólio FATEC...

:: Criar pasta principal
mkdir "portifolio-fatec" 2>nul

:: Entrar na pasta principal
cd "portifolio-fatec"

:: Engenharia de Software
mkdir "Engenharia_de_Software" 2>nul
mkdir "Engenharia_de_Software\engenharia-software-1" 2>nul
mkdir "Engenharia_de_Software\engenharia-software-2" 2>nul
mkdir "Engenharia_de_Software\gestao-agil-projetos" 2>nul

:: Desenvolvimento Web
mkdir "Desenvolvimento_Web" 2>nul
mkdir "Desenvolvimento_Web\web-1" 2>nul
mkdir "Desenvolvimento_Web\web-2" 2>nul
mkdir "Desenvolvimento_Web\web-3" 2>nul
mkdir "Desenvolvimento_Web\lab-web" 2>nul

:: Banco de Dados
mkdir "Banco_de_Dados" 2>nul
mkdir "Banco_de_Dados\modelagem-bd" 2>nul
mkdir "Banco_de_Dados\bd-relacional" 2>nul
mkdir "Banco_de_Dados\bd-nao-relacional" 2>nul

:: Programação
mkdir "Programacao" 2>nul
mkdir "Programacao\logica-algoritmos" 2>nul
mkdir "Programacao\tecnicas-programacao-1" 2>nul
mkdir "Programacao\tecnicas-programacao-2" 2>nul
mkdir "Programacao\estrutura-dados" 2>nul

:: Dispositivos Móveis
mkdir "Dispositivos_Moveis" 2>nul
mkdir "Dispositivos_Moveis\mobile-1" 2>nul
mkdir "Dispositivos_Moveis\mobile-2" 2>nul
mkdir "Dispositivos_Moveis\lab-mobile" 2>nul

:: Experiência do Usuário
mkdir "Experiencia_do_Usuario" 2>nul
mkdir "Experiencia_do_Usuario\design-digital" 2>nul
mkdir "Experiencia_do_Usuario\ihc" 2>nul
mkdir "Experiencia_do_Usuario\ux" 2>nul

:: Cloud DevOps
mkdir "Cloud_DevOps" 2>nul
mkdir "Cloud_DevOps\computacao-nuvem-1" 2>nul
mkdir "Cloud_DevOps\computacao-nuvem-2" 2>nul
mkdir "Cloud_DevOps\ci-cd-devops" 2>nul

:: Machine Learning
mkdir "Machine_Learning" 2>nul
mkdir "Machine_Learning\estatistica" 2>nul
mkdir "Machine_Learning\ml" 2>nul
mkdir "Machine_Learning\mineracao-dados" 2>nul
mkdir "Machine_Learning\pln" 2>nul

:: Infraestrutura de Sistemas
mkdir "Infraestrutura_Sistemas" 2>nul
mkdir "Infraestrutura_Sistemas\sistemas-operacionais-redes" 2>nul
mkdir "Infraestrutura_Sistemas\iot-aplicacoes" 2>nul
mkdir "Infraestrutura_Sistemas\seguranca" 2>nul

:: Outros
mkdir "Outros" 2>nul
mkdir "Outros\ingles-1-ao-4" 2>nul
mkdir "Outros\redacao-tecnica" 2>nul
mkdir "Outros\etica-patente" 2>nul
mkdir "Outros\matematica-algebra" 2>nul

:: Docs
mkdir "docs" 2>nul

echo.
echo ✅ Estrutura de pastas criada com sucesso!
echo 📁 Todas as pastas foram criadas dentro de "portifolio-fatec"
echo.
echo Para visualizar a estrutura criada, execute:
echo tree /f portifolio-fatec
echo.
pause