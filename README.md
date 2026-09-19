# Isaías Bez — Psicólogo Online 🧠

Site institucional de psicoterapia online do psicólogo **Isaías Bez**.
Site estático (HTML, CSS e JavaScript puro), multi-página, hospedado no **Firebase Hosting**.

🌐 **No ar:** https://isaiasbez.com.br

## 📁 Estrutura

```
isaiasbez/
├── index.html            # Página inicial (hero + apresentação)
├── sobre.html            # "Sobre o que é?"
├── como-funciona.html    # Como funciona o atendimento
├── faq.html              # Perguntas frequentes
├── contato.html          # Contato / agendamento
├── 404.html              # Página de erro
├── style.css             # Estilos e design system
├── script.js             # Interações (menu, FAQ, etc.)
├── robots.txt            # Diretrizes para crawlers
├── sitemap.xml           # Sitemap
├── images/               # Imagens (.webp otimizadas + icon/perfil)
├── firebase.json         # Configuração do Firebase Hosting
├── .firebaserc           # Projeto Firebase (site-ee8c1)
├── deploy-firebase.sh    # Script de deploy
└── README.md             # Este arquivo
```

## 🚀 Rodar localmente

Servidor estático simples:

```bash
python3 -m http.server 8000
```

Depois acesse `http://localhost:8000`.

## 🌐 Deploy (Firebase Hosting)

O site é publicado no Firebase Hosting (projeto `site-ee8c1`).

### Forma simples

```bash
./deploy-firebase.sh
```

O script baixa o Firebase CLI (binário standalone, **não precisa de Node.js**),
pede login no navegador na primeira vez e publica o Hosting.

### Manualmente (se já tiver o Firebase CLI)

```bash
firebase login          # só na primeira vez
firebase deploy --only hosting
```

O domínio `isaiasbez.com.br` está conectado ao site padrão do projeto no Firebase Hosting.

## ✏️ Contato do profissional

- **WhatsApp:** (14) 99641-1514
- **E-mail:** contatoisaiasbez@gmail.com
- **Instagram:** [@psi.isaiasbez](https://instagram.com/psi.isaiasbez)

## 🛠️ Tecnologias

- **HTML5** semântico, multi-página
- **CSS3** (design system com variáveis, Grid, Flexbox)
- **JavaScript** vanilla (ES6+)
- **Google Fonts:** Bodoni Moda, Newsreader, Space Grotesk, Spline Sans Mono
- **Hospedagem:** Firebase Hosting

---

**Psicoterapia online — autoconhecimento, equilíbrio emocional e qualidade de vida.**
