#!/bin/bash

# ============================================
# Script de Deploy para Google Cloud Storage
# ============================================

set -e  # Exit on error

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configurações
PROJECT_ID="seu-project-id"  # ALTERE AQUI
BUCKET_NAME="seu-site-psicologo"  # ALTERE AQUI
REGION="southamerica-east1"  # São Paulo

echo -e "${GREEN}🚀 Iniciando deploy para Google Cloud Storage${NC}"
echo ""

# Verificar se gcloud está instalado
if ! command -v gcloud &> /dev/null; then
    echo -e "${RED}❌ Google Cloud SDK não encontrado${NC}"
    echo "Instale em: https://cloud.google.com/sdk/docs/install"
    exit 1
fi

# Verificar se está autenticado
if ! gcloud auth list --filter=status:ACTIVE --format="value(account)" &> /dev/null; then
    echo -e "${YELLOW}⚠️  Fazendo login no Google Cloud...${NC}"
    gcloud auth login
fi

# Configurar projeto
echo -e "${YELLOW}📋 Configurando projeto: ${PROJECT_ID}${NC}"
gcloud config set project ${PROJECT_ID}

# Verificar se o bucket já existe
if gsutil ls -b gs://${BUCKET_NAME} &> /dev/null; then
    echo -e "${YELLOW}⚠️  Bucket já existe. Atualizando arquivos...${NC}"
else
    echo -e "${YELLOW}📦 Criando bucket: ${BUCKET_NAME}${NC}"
    gsutil mb -c STANDARD -l ${REGION} gs://${BUCKET_NAME}
    
    # Configurar como website
    echo -e "${YELLOW}🌐 Configurando bucket como website${NC}"
    gsutil web set -m index.html -e 404.html gs://${BUCKET_NAME}
fi

# Upload dos arquivos
echo -e "${YELLOW}📤 Fazendo upload dos arquivos...${NC}"
gsutil -m rsync -r -d . gs://${BUCKET_NAME}

# Tornar arquivos públicos
echo -e "${YELLOW}🔓 Tornando arquivos públicos${NC}"
gsutil iam ch allUsers:objectViewer gs://${BUCKET_NAME}

# Configurar cache headers
echo -e "${YELLOW}⚡ Configurando cache headers${NC}"

# HTML - cache curto (1 hora)
gsutil -m setmeta -h "Cache-Control:public, max-age=3600" \
    "gs://${BUCKET_NAME}/*.html"

# CSS e JS - cache longo (1 ano)
gsutil -m setmeta -h "Cache-Control:public, max-age=31536000" \
    "gs://${BUCKET_NAME}/*.css" \
    "gs://${BUCKET_NAME}/*.js"

# Imagens - cache longo (1 ano)
gsutil -m setmeta -h "Cache-Control:public, max-age=31536000" \
    "gs://${BUCKET_NAME}/images/*"

# Configurar CORS (se necessário para formulários)
echo -e "${YELLOW}🔧 Configurando CORS${NC}"
cat > cors.json << EOF
[
  {
    "origin": ["*"],
    "method": ["GET", "HEAD"],
    "responseHeader": ["Content-Type"],
    "maxAgeSeconds": 3600
  }
]
EOF
gsutil cors set cors.json gs://${BUCKET_NAME}
rm cors.json

# Obter URL do site
SITE_URL="https://storage.googleapis.com/${BUCKET_NAME}/index.html"

echo ""
echo -e "${GREEN}✅ Deploy concluído com sucesso!${NC}"
echo ""
echo -e "${GREEN}🌐 Seu site está disponível em:${NC}"
echo -e "${YELLOW}${SITE_URL}${NC}"
echo ""
echo -e "${GREEN}💡 Próximos passos:${NC}"
echo "1. Configure um domínio personalizado (opcional)"
echo "   https://cloud.google.com/storage/docs/hosting-static-website"
echo ""
echo "2. Configure Cloud CDN para melhor performance (opcional)"
echo "   https://cloud.google.com/cdn/docs/setting-up-cdn-with-bucket"
echo ""
echo "3. Monitore custos no Google Cloud Console"
echo "   https://console.cloud.google.com/billing"
echo ""

# Estimar custos
echo -e "${GREEN}💰 Estimativa de custos mensais:${NC}"
echo "Storage (1GB): ~\$0.026/mês"
echo "Bandwidth (10GB): ~\$0.80/mês"
echo "Total estimado: < \$1/mês para tráfego baixo"
echo ""
