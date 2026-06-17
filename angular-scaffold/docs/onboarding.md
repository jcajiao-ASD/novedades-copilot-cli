# Guía de Onboarding

## Para Nuevos Desarrolladores

### Paso 1: Verificar prerrequisitos
```bash
bun --version    # >= 1.0
node --version   # >= 20 (LTS)
git --version
ng version       # Angular CLI 22.x
```

Si no tienes bun: https://bun.sh/docs/installation
Si no tienes Angular CLI: `bun install -g @angular/cli`

### Paso 2: Clonar e instalar
```bash
git clone <url-del-repositorio>
cd <nombre-proyecto>
bun install
```

### Paso 3: Explorar el código base
```text
src/app/
├── core/          ← Empieza aquí para entender servicios globales
├── shared/        ← Componentes reutilizables del equipo
├── features/      ← Aquí vive la lógica de negocio
│   └── example/   ← Ejemplo completo para entender patrones
├── app.routes.ts  ← Enrutamiento raíz
└── app.config.ts  ← Configuración global de Angular
```

### Paso 4: Ejecutar la aplicación
```bash
bun run start
```
Visita http://localhost:4200 — verás el ejemplo práctico del scaffold.

### Paso 5: Ejecutar tests
```bash
bun run test
```

### Paso 6: Tu primer commit
Los commits siguen Conventional Commits:
```bash
git add .
git commit -m "feat(users): agregar componente de listado"
```

Si el commit falla, revisa el mensaje o los errores de lint.

## Flujo de Trabajo Diario

1. `git pull` — actualizar rama
2. `bun install` — si hubo cambios en `package.json`
3. Desarrollar...
4. `bun run lint` — verificar antes de commitear
5. `git add . && git commit -m "feat: ..."` — los hooks corren automáticamente
6. `git push`

## Preguntas Frecuentes

**¿Por qué bun y no npm?**
Instalaciones 10-25x más rápidas, compatible con npm, lock file incluido.

**¿Dónde pongo un servicio nuevo?**
- Si es global (auth, config): `src/app/core/`
- Si es de una feature: `src/app/features/<mi-feature>/services/`
- Si es reutilizable: `src/app/shared/services/`

**¿Cómo agrego una nueva página/ruta?**
Ver `docs/architecture.md` sección Features.

**¿El linter me bloquea con reglas muy estrictas?**
Habla con el equipo antes de deshabilitar reglas. Si hay consenso, modifica `eslint.config.js` y documenta el motivo.
