# Herramientas del Scaffold

## Package Manager: Bun

Bun es hasta 25x más rápido que npm para instalaciones. Comandos equivalentes:

| npm | bun |
|-----|-----|
| `npm install` | `bun install` |
| `npm run <script>` | `bun run <script>` |
| `npm install <pkg>` | `bun add <pkg>` |
| `npm install -D <pkg>` | `bun add -d <pkg>` |
| `npm uninstall <pkg>` | `bun remove <pkg>` |
| `npx <cmd>` | `bunx <cmd>` |

## Linting: ESLint + angular-eslint

Configuración en `eslint.config.js` (flat config format de ESLint v9+).

Ejecutar:
```bash
bun run lint          # Ver errores
bun run lint:fix      # Corregir automáticamente
```

Las reglas cubren:
- TypeScript: `@typescript-eslint/recommended`
- Angular TS: `@angular-eslint/recommended`
- Angular HTML: `@angular-eslint/template/recommended` + accesibilidad

## Pre-commit Hooks: Husky + lint-staged

Al hacer `git commit`, automáticamente:
1. Se ejecuta `eslint --fix` solo en los archivos staged
2. Se valida el mensaje de commit con commitlint

**¿Por qué lint-staged?** Solo procesa archivos que vas a commitear, no todo el proyecto.

### Deshabilitar hooks en emergencias
```bash
git commit --no-verify -m "fix: hotfix urgente"
```
⚠️ Usar con precaución. Siempre ejecutar `bun run lint` después.

## Conventional Commits: commitlint

Configuración en `commitlint.config.js`. Formato:
```text
<tipo>(<scope opcional>): <descripción>
```

Tipos válidos: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `perf`, `ci`

## Angular CLI

```bash
# Generar componente
ng generate component features/mi-feature/components/mi-componente

# Generar servicio
ng generate service core/mi-servicio

# Generar guard
ng generate guard core/guards/mi-guard

# Build de producción
ng build
```
