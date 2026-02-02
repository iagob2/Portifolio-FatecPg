// ============================================
// FUNCIONALIDADES PRINCIPAIS
// ============================================

// Inicialização quando o DOM estiver carregado
document.addEventListener('DOMContentLoaded', function () {
    inicializarPlayground();
    inicializarTema();
    inicializarBusca();
    inicializarScrollSuave();
    atualizarLinkAtivo();
});

// ============================================
// PLAYGROUND INTERATIVO
// ============================================
function inicializarPlayground() {
    const containers = document.querySelectorAll('.playground-container');

    containers.forEach(container => {
        const editor = container.querySelector('.editor-codigo');
        const visualizacao = container.querySelector('.visualizacao-resultado');

        if (!editor || !visualizacao) return;

        function atualizar() {
            try {
                const documento = visualizacao.contentDocument;
                if (documento) {
                    documento.open();
                    documento.write(editor.value);
                    documento.close();
                }
            } catch (error) {
                console.error('Erro ao atualizar preview:', error);
            }
        }

        // Atualiza quando digitar
        editor.addEventListener('input', atualizar);

        // Inicia o conteúdo ao carregar a página
        atualizar();
    });
}

// ============================================
// TEMA CLARO/ESCURO
// ============================================
function inicializarTema() {
    // Verifica se há preferência salva
    const temaSalvo = localStorage.getItem('tema');
    const preferenciaSistema = window.matchMedia('(prefers-color-scheme: dark)').matches;

    // Define tema inicial
    const temaInicial = temaSalvo || (preferenciaSistema ? 'dark' : 'light');
    aplicarTema(temaInicial);

    // Botão de alternância
    const themeToggle = document.querySelector('.theme-toggle');
    if (themeToggle) {
        themeToggle.addEventListener('click', alternarTema);
    }

    // Escuta mudanças na preferência do sistema
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
        if (!localStorage.getItem('tema')) {
            aplicarTema(e.matches ? 'dark' : 'light');
        }
    });
}

function alternarTema() {
    const temaAtual = document.documentElement.getAttribute('data-theme') || 'light';
    const novoTema = temaAtual === 'light' ? 'dark' : 'light';
    aplicarTema(novoTema);
    localStorage.setItem('tema', novoTema);
}

function aplicarTema(tema) {
    document.documentElement.setAttribute('data-theme', tema);
    const themeToggle = document.querySelector('.theme-toggle');
    if (themeToggle) {
        const icon = tema === 'dark' ? '🌙' : '☀️';
        const texto = tema === 'dark' ? 'Modo Escuro' : 'Modo Claro';
        themeToggle.innerHTML = `${icon} ${texto}`;
    }
}

// ============================================
// BARRA DE BUSCA
// ============================================
function inicializarBusca() {
    const searchInput = document.querySelector('.search-input');
    if (!searchInput) return;

    searchInput.addEventListener('input', function (e) {
        const termoBusca = e.target.value.toLowerCase().trim();
        filtrarMenu(termoBusca);
    });

    // Limpa busca ao pressionar Escape
    searchInput.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') {
            e.target.value = '';
            filtrarMenu('');
        }
    });
}

function filtrarMenu(termo) {
    const itensMenu = document.querySelectorAll('nav ul li');

    if (!termo) {
        // Mostra todos os itens
        itensMenu.forEach(item => {
            item.classList.remove('hidden');
        });
        return;
    }

    // Filtra itens do menu
    itensMenu.forEach(item => {
        const link = item.querySelector('a');
        if (!link) return;

        const textoLink = link.textContent.toLowerCase();
        if (textoLink.includes(termo)) {
            item.classList.remove('hidden');
        } else {
            item.classList.add('hidden');
        }
    });
}

// ============================================
// SCROLL SUAVE
// ============================================
function inicializarScrollSuave() {
    // Scroll suave já está habilitado via CSS (scroll-behavior: smooth)
    // Aqui adicionamos comportamento adicional para links de navegação

    const linksNavegacao = document.querySelectorAll('nav a[href^="#"]');

    linksNavegacao.forEach(link => {
        link.addEventListener('click', function (e) {
            const href = this.getAttribute('href');
            if (href === '#') return;

            const destino = document.querySelector(href);
            if (destino) {
                e.preventDefault();
                const offsetTop = destino.offsetTop - 20; // Offset para não colar no topo

                window.scrollTo({
                    top: offsetTop,
                    behavior: 'smooth'
                });

                // Atualiza link ativo
                atualizarLinkAtivo();
            }
        });
    });

    // Atualiza link ativo durante o scroll
    window.addEventListener('scroll', debounce(atualizarLinkAtivo, 100));
}

function atualizarLinkAtivo() {
    const secoes = document.querySelectorAll('section[id]');
    const links = document.querySelectorAll('nav a[href^="#"]');

    let secaoAtual = '';
    const scrollPos = window.scrollY + 100;

    secoes.forEach(secao => {
        const topo = secao.offsetTop;
        const altura = secao.offsetHeight;

        if (scrollPos >= topo && scrollPos < topo + altura) {
            secaoAtual = secao.getAttribute('id');
        }
    });

    links.forEach(link => {
        link.classList.remove('active');
        const href = link.getAttribute('href');
        if (href === `#${secaoAtual}`) {
            link.classList.add('active');
        }
    });
}

// ============================================
// UTILITÁRIOS
// ============================================
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// ============================================
// SERVICE WORKER (PWA)
// ============================================
if ('serviceWorker' in navigator) {
    window.addEventListener('load', function () {
        navigator.serviceWorker.register('./sw.js')
            .then(function (registration) {
                console.log('Service Worker registrado com sucesso:', registration.scope);
            })
            .catch(function (error) {
                console.log('Falha ao registrar Service Worker:', error);
            });
    });
}
