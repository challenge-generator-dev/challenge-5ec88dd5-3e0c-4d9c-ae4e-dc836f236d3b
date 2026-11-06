# Aprovisionamiento de Infraestructura para el Servicio de Notificaciones

El equipo de DevOps necesita versionar la infraestructura del servicio de notificaciones utilizando Terraform. El servicio de notificaciones es crítico para la comunicación entre usuarios y debe ser desplegado en una red y computo aprovisionados mediante Terraform. El objetivo es asegurar que la infraestructura sea reproducible y versionada.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo con Terraform |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Exploración y Configuración Inicial

**Objetivo:** Configurar el entorno de Terraform para el aprovisionamiento de la infraestructura.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identificar los componentes de la red y el computo necesarios para el servicio de notificaciones.
- Configurar el archivo principal de Terraform para iniciar el aprovisionamiento.

**Entregable:** Archivo de configuración de Terraform inicial con los componentes básicos de red y computo.

<details>
<summary>Pistas de conocimiento</summary>

- Terraform permite la gestión de infraestructura como código.
- La configuración inicial debe incluir proveedores y recursos básicos.

</details>

### Fase 2: Aprovisionamiento de la Red

**Objetivo:** Aprovisionar la red necesaria para el servicio de notificaciones utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Definir los recursos de red en el archivo de Terraform.
- Verificar que la red se aprovisiona correctamente y está disponible para el servicio.

**Entregable:** Red aprovisionada y verificada para el servicio de notificaciones.

<details>
<summary>Pistas de conocimiento</summary>

- Los recursos de red en Terraform incluyen VPCs, subredes y gateways.
- La verificación de la red puede realizarse mediante comandos de Terraform y pruebas de conectividad.

</details>

### Fase 3: Aprovisionamiento del Computo

**Objetivo:** Aprovisionar el computo necesario para el servicio de notificaciones utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Definir los recursos de computo en el archivo de Terraform.
- Verificar que el computo se aprovisiona correctamente y está disponible para el servicio.

**Entregable:** Computo aprovisionado y verificado para el servicio de notificaciones.

<details>
<summary>Pistas de conocimiento</summary>

- Los recursos de computo en Terraform incluyen instancias, contenedores y servicios.
- La verificación del computo puede realizarse mediante comandos de Terraform y pruebas de disponibilidad.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y cómo se utiliza para aprovisionar infraestructura?
- **paraQueSirve**: ¿Para qué sirve versionar la infraestructura con Terraform?
- **comoSeUsa**: ¿Cómo se configura y ejecuta un archivo de Terraform para aprovisionar recursos?
- **erroresComunes**: ¿Cuáles son los errores comunes al aprovisionar infraestructura con Terraform y cómo se solucionan?

## Criterios de Evaluacion

- Configuración inicial de Terraform para aprovisionar infraestructura.
- Aprovisionamiento correcto de la red para el servicio de notificaciones.
- Aprovisionamiento correcto del computo para el servicio de notificaciones.
- Verificación de la infraestructura aprovisionada.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
