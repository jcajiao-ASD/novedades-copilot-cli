import { CommonModule } from '@angular/common';
import { Component, input } from '@angular/core';

@Component({
  selector: 'app-spinner',
  imports: [CommonModule],
  template: `
    @if (visible()) {
      <div
        class="spinner-container"
        role="status"
        aria-live="polite"
        [attr.aria-label]="message()"
      >
        <div class="spinner" aria-hidden="true"></div>
        <p class="spinner-message">{{ message() }}</p>
      </div>
    }
  `,
  styles: [`
    .spinner-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      gap: 0.75rem;
      padding: 2rem;
      text-align: center;
    }

    .spinner {
      width: 2.5rem;
      height: 2.5rem;
      border: 0.25rem solid #d5d9e5;
      border-top-color: #4f46e5;
      border-radius: 50%;
      animation: spin 0.8s linear infinite;
    }

    .spinner-message {
      margin: 0;
      color: #4b5563;
      font-size: 0.95rem;
    }

    @keyframes spin {
      to {
        transform: rotate(360deg);
      }
    }
  `]
})
export class Spinner {
  readonly visible = input(true);
  readonly message = input('Cargando...');
}
