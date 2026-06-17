import { Routes } from '@angular/router';
import { authGuard } from '../../core/guards/auth.guard';

export const exampleRoutes: Routes = [
  {
    path: '',
    redirectTo: 'users',
    pathMatch: 'full'
  },
  {
    path: 'users',
    canActivate: [authGuard],
    loadComponent: () => import('./components/user-list').then((m) => m.UserList)
  },
  {
    path: 'users/:id',
    canActivate: [authGuard],
    loadComponent: () => import('./components/user-detail').then((m) => m.UserDetail)
  }
];
