# Site Profissional para Psicólogo 🧠

Site one-page moderno e responsivo para psicólogo online, desenvolvido com HTML, CSS e JavaScript puro para máxima performance e custo mínimo no Google Cloud.

## 🎨 Características

- ✅ **Design Premium**: Gradientes modernos, animações suaves e glassmorphism
- ✅ **100% Responsivo**: Funciona perfeitamente em desktop, tablet e mobile
- ✅ **SEO Otimizado**: Meta tags, Open Graph e Schema.org
- ✅ **Performance**: Lazy loading, animações otimizadas e código minimalista
- ✅ **Acessibilidade**: Semântica HTML5 e navegação por teclado
- ✅ **Formulário de Contato**: Integração com Formspree ou Web3Forms (gratuito)
- ✅ **Chat Online**: Suporte para Tawk.to ou Tidio (gratuito)
- ✅ **WhatsApp**: Botões de contato direto

## 📁 Estrutura do Projeto

```
psicologo/
├── index.html          # Página principal
├── styles.css          # Estilos e design system
├── script.js           # Interações e funcionalidades
├── images/             # Imagens e assets
│   └── psychologist.png
├── deploy-gcs.sh       # Script de deploy para Google Cloud
└── README.md           # Este arquivo
```

## 🚀 Como Usar Localmente

1. **Clone ou baixe o projeto**
   ```bash
   cd /home/saulo-lima/Documentos/projetos/psicologo
   ```

2. **Abra o arquivo index.html no navegador**
   - Clique duas vezes no arquivo `index.html`, ou
   - Use um servidor local (recomendado):
   ```bash
   # Python 3
   python3 -m http.server 8000
   
   # Node.js (se tiver npx)
   npx serve
   ```

3. **Acesse no navegador**
   ```
   http://localhost:8000
   ```

## ✏️ Personalização

### 1. Informações Básicas

Edite o arquivo `index.html` e substitua:

- **Nome do psicólogo**: Procure por "Dr. Rafael Silva" e substitua
- **CRP**: Procure por "CRP 06/123456" e substitua pelo número real
- **Telefone/WhatsApp**: Substitua "5511999999999" pelo número real (formato: 55 + DDD + número)
- **Email**: Substitua "contato@psicologo.com"
- **Instagram**: Substitua "@psicologo" pelo handle real

### 2. Foto do Psicólogo

Substitua o arquivo `images/psychologist.png` pela foto real do profissional.

### 3. Cores e Design

Edite o arquivo `styles.css` na seção de variáveis CSS (`:root`):

```css
:root {
    --color-primary: #4F46E5;        /* Cor principal */
    --color-secondary: #06B6D4;      /* Cor secundária */
    --color-accent: #8B5CF6;         /* Cor de destaque */
}
```

### 4. Configurar Formulário de Contato

Escolha uma das opções gratuitas:

#### Opção A: Formspree (Recomendado)
1. Acesse [formspree.io](https://formspree.io/)
2. Crie uma conta gratuita
3. Crie um novo formulário e copie o ID
4. Edite `script.js` e descomente as linhas do Formspree:
   ```javascript
   const response = await fetch('https://formspree.io/f/YOUR_FORM_ID', {
   ```
5. Substitua `YOUR_FORM_ID` pelo seu ID

#### Opção B: Web3Forms
1. Acesse [web3forms.com](https://web3forms.com/)
2. Insira seu email e obtenha a Access Key
3. Edite `script.js` e descomente as linhas do Web3Forms:
   ```javascript
   const response = await fetch('https://api.web3forms.com/submit', {
       ...
       access_key: 'YOUR_WEB3FORMS_ACCESS_KEY',
   ```

### 5. Configurar Chat Online

#### Opção A: Tawk.to (Recomendado)
1. Acesse [tawk.to](https://www.tawk.to/)
2. Crie uma conta gratuita
3. Copie o código de integração
4. Edite `index.html` e descomente o script do Tawk.to
5. Substitua `YOUR_PROPERTY_ID` pelo seu ID

#### Opção B: Tidio
1. Acesse [tidio.com](https://www.tidio.com/)
2. Crie uma conta gratuita
3. Copie o código de integração
4. Cole no final do `index.html` antes de `</body>`

## 🌐 Deploy no Google Cloud Storage

### Custo Estimado
- **Storage**: ~$0.026/GB/mês
- **Bandwidth**: ~$0.08/GB transferido
- **Total**: < $1/mês para sites pequenos

### Passo a Passo

1. **Instale o Google Cloud SDK**
   ```bash
   # Ubuntu/Debian
   sudo apt-get install google-cloud-sdk
   
   # Ou baixe de: https://cloud.google.com/sdk/docs/install
   ```

2. **Autentique-se**
   ```bash
   gcloud auth login
   gcloud config set project SEU_PROJECT_ID
   ```

3. **Execute o script de deploy**
   ```bash
   chmod +x deploy-gcs.sh
   ./deploy-gcs.sh
   ```

4. **Configure domínio personalizado (opcional)**
   - Siga: https://cloud.google.com/storage/docs/hosting-static-website

### Deploy Manual

```bash
# 1. Criar bucket
gsutil mb -c STANDARD -l southamerica-east1 gs://seu-site-psicologo

# 2. Configurar como site público
gsutil web set -m index.html -e 404.html gs://seu-site-psicologo

# 3. Upload dos arquivos
gsutil -m cp -r * gs://seu-site-psicologo/

# 4. Tornar público
gsutil iam ch allUsers:objectViewer gs://seu-site-psicologo

# 5. Configurar cache
gsutil setmeta -h "Cache-Control:public, max-age=3600" gs://seu-site-psicologo/*.html
gsutil setmeta -h "Cache-Control:public, max-age=31536000" gs://seu-site-psicologo/*.css
gsutil setmeta -h "Cache-Control:public, max-age=31536000" gs://seu-site-psicologo/*.js
gsutil setmeta -h "Cache-Control:public, max-age=31536000" gs://seu-site-psicologo/images/*
```

Seu site estará disponível em:
```
https://storage.googleapis.com/seu-site-psicologo/index.html
```

## 🔧 Alternativas de Hospedagem (Ainda Mais Baratas)

### 1. GitHub Pages (GRÁTIS)
```bash
# Criar repositório no GitHub
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/seu-usuario/psicologo.git
git push -u origin main

# Ativar GitHub Pages nas configurações do repositório
# Seu site estará em: https://seu-usuario.github.io/psicologo/
```

### 2. Netlify (GRÁTIS)
1. Acesse [netlify.com](https://www.netlify.com/)
2. Arraste a pasta do projeto
3. Pronto! Site no ar em segundos

### 3. Vercel (GRÁTIS)
1. Acesse [vercel.com](https://vercel.com/)
2. Conecte seu repositório GitHub
3. Deploy automático

## 📊 Performance

O site foi otimizado para:
- ✅ Lighthouse Score > 90 em todas as categorias
- ✅ First Contentful Paint < 1.5s
- ✅ Time to Interactive < 3s
- ✅ Cumulative Layout Shift < 0.1

## 🛠️ Tecnologias

- **HTML5**: Estrutura semântica
- **CSS3**: Design system com variáveis CSS, Grid, Flexbox
- **JavaScript ES6+**: Vanilla JS, Intersection Observer API
- **Google Fonts**: Inter e Outfit

## 📝 Licença

Este projeto é de uso livre para fins profissionais.

## 🆘 Suporte

Para dúvidas ou problemas:
1. Verifique se todos os arquivos estão no lugar correto
2. Abra o Console do navegador (F12) para ver erros
3. Verifique se as URLs de WhatsApp, email e redes sociais estão corretas

## 🎯 Próximos Passos

- [ ] Substituir conteúdo placeholder por conteúdo real
- [ ] Adicionar foto profissional
- [ ] Configurar formulário de contato
- [ ] Configurar chat online
- [ ] Testar em diferentes dispositivos
- [ ] Fazer deploy
- [ ] Configurar domínio personalizado
- [ ] Configurar Google Analytics (opcional)

---

**Desenvolvido com 💜 para profissionais da saúde mental**
