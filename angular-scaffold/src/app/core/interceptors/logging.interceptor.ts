import { HttpInterceptorFn } from '@angular/common/http';
import { finalize } from 'rxjs';

export const loggingInterceptor: HttpInterceptorFn = (req, next) => {
  const start = Date.now();
  console.log(`[HTTP] → ${req.method} ${req.url}`);

  return next(req).pipe(
    finalize(() => {
      const elapsed = Date.now() - start;
      console.log(`[HTTP] ← ${req.method} ${req.url} (${elapsed}ms)`);
    })
  );
};
