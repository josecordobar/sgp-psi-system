# Definición del Stack Tecnológico (MVP)

## Dependencias Principales (package.json)
```json
{
  "dependencies": {
    "next": "14.x",
    "react": "18.x",
    "react-dom": "18.x",
    "@supabase/supabase-js": "latest",
    "@supabase/ssr": "latest",
    "prisma": "latest",
    "@prisma/client": "latest",
    "tailwindcss": "latest",
    "@radix-ui/react-*": "latest",
    "lucide-react": "latest",
    "date-fns": "latest",
    "recharts": "latest",
    "@react-pdf/renderer": "latest",
    "zod": "latest",
    "sonner": "latest"
  },
  "devDependencies": {
    "typescript": "5.x",
    "@types/node": "20.x",
    "@types/react": "18.x",
    "eslint": "8.x"
  }
}
```

## Configuración de Entorno (.env.local)
Variables requeridas para la conexión:
- NEXT_PUBLIC_SUPABASE_URL
- NEXT_PUBLIC_SUPABASE_ANON_KEY
- SUPABASE_SERVICE_ROLE_KEY (Para tareas administrativas backend)
- DATABASE_URL (String de conexión PostgreSQL de Supabase)
