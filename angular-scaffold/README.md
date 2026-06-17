# Angular 22 Scaffold 🚀

Punto de partida oficial para proyectos Angular del área. Diseñado para fiabilidad, mantenibilidad y seguridad.

## Stack Tecnológico

| Tecnología | Versión | Propósito |
|-----------|---------|-----------|
| Angular | 22.x | Framework principal |
| TypeScript | 5.x | Lenguaje de programación |
| Bun | 1.x | Package manager y runtime |
| ESLint + angular-eslint | Latest | Linting de TypeScript y templates |
| Husky | Latest | Git hooks |
| lint-staged | Latest | Linting solo de archivos staged |
| commitlint | Latest | Validación de mensajes de commit |

## Requisitos Previos

- [Bun](https://bun.sh) >= 1.0
- Node.js >= 20 (LTS)
- Git

## Inicio Rápido

### 1. Clonar y configurar
```bash
git clone <repo-url> mi-proyecto
cd mi-proyecto
bun install
```

### 2. Levantar el servidor de desarrollo
```bash
bun run start
# → http://localhost:4200
```

### 3. Explorar el ejemplo incluido
Visita http://localhost:4200 para ver el ejemplo práctico del scaffold.

### 4. Limpiar el ejemplo y comenzar desde cero
```bash
bun run clean:example
```

## Scripts Disponibles

| Script | Descripción |
|--------|-------------|
| `bun run start` | Servidor de desarrollo |
| `bun run build` | Build de producción |
| `bun run build:dev` | Build de desarrollo |
| `bun run test` | Ejecutar tests |
| `bun run lint` | Ejecutar linter |
| `bun run lint:fix` | Corregir errores de lint automáticamente |
| `bun run clean:example` | Eliminar el ejemplo del scaffold |

## Estructura del Proyecto

```text
angular-scaffold/
├── src/
│   ├── app/
│   │   ├── core/              # Servicios singleton, guards, interceptors
│   │   │   ├── interceptors/
│   │   │   └── guards/
│   │   ├── shared/            # Componentes, pipes y directivas reutilizables
│   │   │   └── components/
│   │   ├── features/          # Módulos de funcionalidad (feature-first)
│   │   │   └── example/       # 📌 Ejemplo práctico (eliminar con clean:example)
│   │   ├── app.component.*
│   │   ├── app.config.ts
│   │   └── app.routes.ts
│   ├── assets/
│   ├── styles/
│   │   ├── _variables.scss    # Variables globales SCSS
│   │   ├── _mixins.scss       # Mixins reutilizables
│   │   └── styles.scss        # Estilos globales
│   └── environments/
├── docs/                      # Documentación del scaffold
├── scripts/                   # Scripts de utilidad
│   └── clean-example.sh
├── .husky/                    # Git hooks
├── eslint.config.js           # Configuración ESLint
├── commitlint.config.js       # Convención de commits
└── package.json
```

## Arquitectura y Convenciones

Ver [docs/architecture.md](docs/architecture.md) para la guía completa.

## Flujo de Trabajo Git

Este scaffold usa [Conventional Commits](https://www.conventionalcommits.org/):

```text
feat: nueva funcionalidad
fix: corrección de bug
chore: tareas de mantenimiento
docs: cambios en documentación
style: formateo, sin cambios de lógica
refactor: refactorización de código
test: adición o corrección de tests
perf: mejoras de rendimiento
```

## Onboarding para Nuevos Integrantes

Ver [docs/onboarding.md](docs/onboarding.md) para una guía paso a paso.

## Cómo Evolucionar el Scaffold

Ver [docs/scaffold-evolution.md](docs/scaffold-evolution.md) para guías de actualización y extensión.

## Herramientas y Automatizaciones

Ver [docs/tooling.md](docs/tooling.md) para detalles sobre bun, ESLint, angular-eslint, Husky, lint-staged y commitlint.

## Licencia

Interno — uso exclusivo del área.
