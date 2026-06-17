# Arquitectura del Scaffold

## Principios de Diseño

1. **Feature-first**: Las funcionalidades se organizan por dominio, no por tipo de archivo
2. **Standalone Components**: Sin NgModules salvo que sea estrictamente necesario
3. **Lazy Loading**: Todas las rutas de funcionalidades cargan de forma lazy
4. **Separation of Concerns**: Core vs Shared vs Features claramente delimitados

## Capas de la Aplicación

### Core (`src/app/core/`)
Contiene todo lo que debe instanciarse una sola vez en la aplicación:
- **Interceptors HTTP**: autenticación, manejo de errores globales, logging
- **Guards**: protección de rutas
- **Servicios globales**: configuración, autenticación

### Shared (`src/app/shared/`)
Componentes, pipes y directivas reutilizables sin lógica de negocio:
- No importa nada de `core/` ni de `features/`
- Solo depende de Angular y librerías externas

### Features (`src/app/features/`)
Cada funcionalidad es un directorio independiente con:
```text
features/mi-feature/
├── components/        # Componentes específicos de la feature
├── services/          # Servicios de la feature
├── models/            # Interfaces y tipos
├── mi-feature.routes.ts
└── mi-feature.component.ts
```

## Gestión del Estado

Para estado simple: Signals de Angular (`signal()`, `computed()`, `effect()`)
Para estado complejo: evaluar NgRx o el patrón de Servicios con BehaviorSubject

## Comunicación HTTP

Usar `HttpClient` con interceptors para:
- Adjuntar tokens de autenticación
- Manejar errores globalmente
- Logging de peticiones

## Routing

- Rutas definidas en `app.routes.ts` (raíz)
- Cada feature tiene su propio `*.routes.ts`
- Lazy loading por defecto: `loadComponent` para componentes standalone

## Convenciones de Nombre

| Tipo | Convención | Ejemplo |
|------|-----------|---------|
| Componente | `kebab-case.component.ts` | `user-list.component.ts` |
| Servicio | `kebab-case.service.ts` | `auth.service.ts` |
| Interceptor | `kebab-case.interceptor.ts` | `auth.interceptor.ts` |
| Guard | `kebab-case.guard.ts` | `auth.guard.ts` |
| Interfaz/Modelo | `kebab-case.model.ts` | `user.model.ts` |
| Ruta | `kebab-case.routes.ts` | `users.routes.ts` |
