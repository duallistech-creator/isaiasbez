#!/bin/bash
# ============================================
# Deploy do site para o Firebase Hosting
# Projeto: site-ee8c1  (site: https://isaiasbez.com.br)
# ============================================
#
# Não precisa de Node.js: usa o binário standalone do Firebase CLI.
# Na primeira vez, abre o navegador para você fazer login no Firebase.

set -e

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
cd "$(dirname "$0")"

# 1) Garante o Firebase CLI (standalone, sem npm)
FIREBASE_BIN="${FIREBASE_BIN:-$HOME/firebase}"
if command -v firebase >/dev/null 2>&1; then
  FB="firebase"
elif [ -x "$FIREBASE_BIN" ]; then
  FB="$FIREBASE_BIN"
else
  echo -e "${YELLOW}⬇️  Baixando Firebase CLI (standalone) para ${FIREBASE_BIN}...${NC}"
  curl -fLo "$FIREBASE_BIN" https://firebase.tools/bin/macos/latest
  chmod +x "$FIREBASE_BIN"
  FB="$FIREBASE_BIN"
fi

# 2) Login (abre o navegador só na primeira vez)
if ! "$FB" projects:list >/dev/null 2>&1; then
  echo -e "${YELLOW}🔑 Faça login no Firebase (abrirá o navegador)...${NC}"
  "$FB" login
fi

# 3) Deploy do Hosting
echo -e "${YELLOW}📤 Publicando no Firebase Hosting...${NC}"
"$FB" deploy --only hosting

echo ""
echo -e "${GREEN}✅ Deploy concluído!${NC}"
echo -e "${GREEN}🌐 https://isaiasbez.com.br${NC}"
