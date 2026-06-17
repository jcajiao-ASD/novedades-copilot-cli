#!/usr/bin/env bash
set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

SCAFFOLD_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo -e "${BLUE}🧹 Angular 22 Scaffold — Limpieza de ejemplo${NC}"
echo -e "${BLUE}=============================================${NC}"
echo ""
echo -e "Este script eliminará el ejemplo práctico del scaffold."
echo -e "Las siguientes carpetas y archivos serán ${RED}eliminados${NC}:"
echo ""
echo "  • src/app/features/example/"
echo "  • src/app/core/interceptors/logging.interceptor.ts"
echo "  • src/app/core/guards/auth.guard.ts"
echo "  • src/app/shared/components/spinner/"
echo ""
echo -e "${YELLOW}⚠️  Esta acción no se puede deshacer fácilmente.${NC}"
echo -e "   Asegúrate de tener tus cambios commiteados antes de continuar."
echo ""

# Prompt for confirmation
read -r -p "¿Deseas continuar? (s/N) " CONFIRM
if [[ ! "$CONFIRM" =~ ^[sS]$ ]]; then
  echo -e "${YELLOW}Operación cancelada.${NC}"
  exit 0
fi

echo ""
echo -e "${BLUE}Eliminando archivos del ejemplo...${NC}"

# Remove example feature
if [ -d "$SCAFFOLD_ROOT/src/app/features/example" ]; then
  rm -rf "$SCAFFOLD_ROOT/src/app/features/example"
  echo -e "  ${GREEN}✓${NC} src/app/features/example/ eliminado"
fi

# Remove example files from core/
if [ -f "$SCAFFOLD_ROOT/src/app/core/interceptors/logging.interceptor.ts" ]; then
  rm -f "$SCAFFOLD_ROOT/src/app/core/interceptors/logging.interceptor.ts"
  echo -e "  ${GREEN}✓${NC} src/app/core/interceptors/logging.interceptor.ts eliminado"
fi

if [ -f "$SCAFFOLD_ROOT/src/app/core/guards/auth.guard.ts" ]; then
  rm -f "$SCAFFOLD_ROOT/src/app/core/guards/auth.guard.ts"
  echo -e "  ${GREEN}✓${NC} src/app/core/guards/auth.guard.ts eliminado"
fi

# Remove spinner from shared/
if [ -d "$SCAFFOLD_ROOT/src/app/shared/components/spinner" ]; then
  rm -rf "$SCAFFOLD_ROOT/src/app/shared/components/spinner"
  echo -e "  ${GREEN}✓${NC} src/app/shared/components/spinner/ eliminado"
fi

# Clean up empty directories
rmdir "$SCAFFOLD_ROOT/src/app/features" 2>/dev/null && \
  echo -e "  ${GREEN}✓${NC} src/app/features/ (vacía) eliminada" || true

rmdir "$SCAFFOLD_ROOT/src/app/core/interceptors" 2>/dev/null && \
  echo -e "  ${GREEN}✓${NC} src/app/core/interceptors/ (vacía) eliminada" || true

rmdir "$SCAFFOLD_ROOT/src/app/core/guards" 2>/dev/null && \
  echo -e "  ${GREEN}✓${NC} src/app/core/guards/ (vacía) eliminada" || true

rmdir "$SCAFFOLD_ROOT/src/app/core" 2>/dev/null && \
  echo -e "  ${GREEN}✓${NC} src/app/core/ (vacía) eliminada" || true

rmdir "$SCAFFOLD_ROOT/src/app/shared/components" 2>/dev/null && true
rmdir "$SCAFFOLD_ROOT/src/app/shared" 2>/dev/null && true

# Restore clean app.routes.ts
cat > "$SCAFFOLD_ROOT/src/app/app.routes.ts" << 'EOF2'
import { Routes } from '@angular/router';

export const routes: Routes = [];
EOF2
echo -e "  ${GREEN}✓${NC} src/app/app.routes.ts restaurado"

# Restore clean app.config.ts
cat > "$SCAFFOLD_ROOT/src/app/app.config.ts" << 'EOF2'
import { ApplicationConfig, provideBrowserGlobalErrorListeners } from '@angular/core';
import { provideRouter } from '@angular/router';

import { routes } from './app.routes';

export const appConfig: ApplicationConfig = {
  providers: [
    provideBrowserGlobalErrorListeners(),
    provideRouter(routes)
  ]
};
EOF2
echo -e "  ${GREEN}✓${NC} src/app/app.config.ts restaurado"

echo ""
echo -e "${GREEN}✅ Ejemplo eliminado exitosamente.${NC}"
echo ""
echo -e "El scaffold está listo para comenzar tu proyecto:"
echo ""
echo -e "  ${BLUE}bun run start${NC}   — Inicia el servidor de desarrollo"
echo -e "  ${BLUE}bun run build${NC}   — Build de producción"
echo -e "  ${BLUE}bun run lint${NC}    — Ejecutar linter"
echo ""
echo -e "Para más información, consulta ${BLUE}docs/onboarding.md${NC}"
