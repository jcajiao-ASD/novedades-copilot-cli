# Evolución y Mantenimiento del Scaffold

## Principios para Cambios

1. **Consenso del equipo**: Cambios al scaffold afectan a todos
2. **Documentar el motivo**: Cada cambio debe tener un `why` claro
3. **Backward compatibility**: Evitar cambios breaking sin migración
4. **Probar antes de adoptar**: Evaluar librerías en proyectos pequeños primero

## Actualizar Angular

```bash
# Ver versiones disponibles
ng update

# Actualizar Angular y sus dependencias
ng update @angular/core @angular/cli

# Verificar que todo sigue funcionando
bun run build
bun run test
bun run lint
```

## Agregar una Nueva Librería

### Checklist antes de agregar
- [ ] ¿Es mantenida activamente? (commits recientes en GitHub)
- [ ] ¿Tiene soporte para Angular 22+?
- [ ] ¿Cuántas vulnerabilidades reporta `bun audit`?
- [ ] ¿Reemplaza algo existente o es adicional?
- [ ] ¿El equipo tiene consenso?

### Proceso
```bash
# Instalar
bun add <paquete>

# Verificar vulnerabilidades
bun audit

# Actualizar docs/tooling.md si es herramienta de desarrollo
```

## Actualizar Dependencias de Seguridad

```bash
# Ver dependencias desactualizadas
bun outdated

# Actualizar dependencias de desarrollo
bun update --dev

# Verificar vulnerabilidades
bun audit
```

## Deprecar el Scaffold

Cuando sea necesario migrar a una versión mayor:
1. Crear un nuevo scaffold con la versión nueva
2. Documentar diferencias en `docs/migration.md`
3. Dar un período de transición al equipo
4. No eliminar el scaffold anterior hasta que todos los proyectos migren

## Historial de Cambios

| Fecha | Versión | Cambio | Autor |
|-------|---------|--------|-------|
| 2026-06 | 1.0.0 | Versión inicial con Angular 22 | Equipo |
