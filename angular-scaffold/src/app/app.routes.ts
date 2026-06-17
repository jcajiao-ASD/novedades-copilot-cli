import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: '',
    redirectTo: 'example',
    pathMatch: 'full'
  },
  {
    path: 'example',
    loadChildren: () => import('./features/example/example.routes').then((m) => m.exampleRoutes)
  },
  {
    path: '**',
    redirectTo: 'example'
  }
];
