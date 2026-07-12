# Insert 76 new links from links-insertados.md
# Date: 2026-07-12
$ErrorActionPreference = "Stop"
$base = "c:\Users\User\Documents\programacion2025\prog_repositorio\proyectos\links-frontend-ia-2026"
$addedDate = "2026-07-12"

# Helper to generate slug
function Get-Slug($name) { return $name.ToLower() -replace '[^a-z0-9]+', '-' -replace '^-|-$', '' }

# ============================================================
# DEFINE ALL 76 NEW RESOURCES
# ============================================================

# --- dns_seguridad_educacion → education-learning → programming-courses (4 links) ---
$eduLinks = @(
    @{
        id = "how-computers-work-eth"; name = "How-Computers-Work-ETH"; slug = "how-computers-work-eth"
        description = "How Computers Work ETH Zurich Onur Mutlu"
        url = "https://youtube.com/playlist?list=PL5Q2soXY2Zi-NVn779PBtYziKiW-zdW5i&si=XPHT--oNLuOgKwaJ"
        tags = @("programming-courses","education-learning","youtube","video","learning","ai")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "education-learning"; subcategory = "programming-courses"
    },
    @{
        id = "cs-stanford"; name = "cs-stanford"; slug = "cs-stanford"
        description = "Stanford Computer Science portal"
        url = "https://www.cs.stanford.edu/"
        tags = @("programming-courses","education-learning","cursos-programacion","resource","education")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "education-learning"; subcategory = "programming-courses"
    },
    @{
        id = "ocw-mit-60002"; name = "ocw-mit-60002"; slug = "ocw-mit-60002"
        description = "MIT 6.0002 Computational Thinking"
        url = "https://ocw.mit.edu/courses/6-0002-introduction-to-computational-thinking-and-data-science-fall-2016"
        tags = @("programming-courses","education-learning","cursos-programacion","learning","education")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "education-learning"; subcategory = "programming-courses"
    },
    @{
        id = "openstax-cs"; name = "openstax-cs"; slug = "openstax-cs"
        description = "Libros CS gratuitos OpenStax"
        url = "https://openstax.org/subjects/computer-science"
        tags = @("programming-courses","education-learning","resource","education","learning")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "education-learning"; subcategory = "programming-courses"
    }
)

# --- dns_seguridad_educacion → security-vpn → security-auth (3 links) ---
$secLinks = @(
    @{
        id = "obscura-web"; name = "obscura-web"; slug = "obscura-web"
        description = "Privacidad y seguridad online anonima"
        url = "https://obscura.sh/"
        tags = @("security-auth","security-vpn","seguridad-auth","y-seguridad-vpn")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "security-vpn"; subcategory = "security-auth"
    },
    @{
        id = "obscura-gh"; name = "obscura-gh"; slug = "obscura-gh"
        description = "Herramienta privacidad open source"
        url = "https://github.com/h4ckf0r0day/obscura"
        tags = @("security-auth","security-vpn","seguridad-auth","github")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "security-vpn"; subcategory = "security-auth"
    },
    @{
        id = "linux-server-secure-gh"; name = "linux-server-secure-gh"; slug = "linux-server-secure-gh"
        description = "Guia completa asegurar servidor Linux"
        url = "https://github.com/imthenachoman/How-To-Secure-A-Linux-Server.git"
        tags = @("security-auth","security-vpn","seguridad-auth","github","tutorial")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "security-vpn"; subcategory = "security-auth"
    }
)

# --- ia_asistentes-desarrollo-china-imagen_1 → ai → development (33 links) ---
$aiDevLinks = @(
    @{
        id = "deep-learning-hardware-dally"; name = "Deep-Learning-Hardware-Dally"; slug = "deep-learning-hardware-dally"
        description = "Directions in Deep Learning Hardware Dally"
        url = "https://youtu.be/gofI47kfD28?is=-KXXL9xwQ_5_j7qs"
        tags = @("ai","development","video")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "rl-keras-full-workshop"; name = "RL-Keras-Full-Workshop"; slug = "rl-keras-full-workshop"
        description = "Full Workshop Reinforcement Learning Keras"
        url = "https://youtu.be/OkEGJ5G3foU?is=glNlZwZJJL2Neztt"
        tags = @("ai","development","video")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "arxiv-org"; name = "arxiv-org"; slug = "arxiv-org"
        description = "Repositorio papers cientificos abierto"
        url = "https://arxiv.org/"
        tags = @("ai","development","github")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "arxiv-paper-2606"; name = "arxiv-paper-2606"; slug = "arxiv-paper-2606"
        description = "Paper arXiv 2606.24937 investigacion IA"
        url = "https://arxiv.org/abs/2606.24937"
        tags = @("ai","development")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "arxiv-paper-1512"; name = "arxiv-paper-1512"; slug = "arxiv-paper-1512"
        description = "Paper arXiv 1512.06808 deep learning"
        url = "https://arxiv.org/abs/1512.06808"
        tags = @("ai","development")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "openai-agents-guide"; name = "openai-agents-guide"; slug = "openai-agents-guide"
        description = "Guia practica construir agentes OpenAI"
        url = "https://cdn.openai.com/business-guides-and-resources/a-practical-guide-to-building-agents.pdf"
        tags = @("ai","development","agent")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "math-deep-pdf"; name = "math-deep-pdf"; slug = "math-deep-pdf"
        description = "Math for Deep Learning UPenn PDF"
        url = "https://www.cis.upenn.edu/~jean/math-deep.pdf"
        tags = @("ai","development","model")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "neural-networks-dkriesel"; name = "neural-networks-dkriesel"; slug = "neural-networks-dkriesel"
        description = "Redes neuronales libro interactivo"
        url = "https://dkriesel.com/en/science/neural_networks"
        tags = @("ai","development","model")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "neuronalenetze-pdf"; name = "neuronalenetze-pdf"; slug = "neuronalenetze-pdf"
        description = "Neural Networks PDF libro Kriesel"
        url = "https://dkriesel.com/_media/science/neuronalenetze-en-zeta2-1col-dkrieselcom.pdf"
        tags = @("ai","development","model")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "spinningup-openai"; name = "spinningup-openai"; slug = "spinningup-openai"
        description = "RL profundo educativo OpenAI SpinningUp"
        url = "https://spinningup.openai.com/en/latest"
        tags = @("ai","development","open-source")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "davidstarsilver"; name = "davidstarsilver"; slug = "davidstarsilver"
        description = "David Silver teaching RL resources"
        url = "https://davidstarsilver.wordpress.com/teaching"
        tags = @("ai","development","video")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "ai-for-beginners-gh"; name = "AI-For-Beginners-gh"; slug = "ai-for-beginners-gh"
        description = "Curso IA Microsoft 24 lecciones"
        url = "https://github.com/microsoft/AI-For-Beginners.git"
        tags = @("ai","development","github","llm")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "awesome-deep-learning-gh"; name = "awesome-deep-learning-gh"; slug = "awesome-deep-learning-gh"
        description = "Lista curada recursos deep learning"
        url = "https://github.com/ChristosChristofidis/awesome-deep-learning"
        tags = @("ai","development","github")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "deep-learning-papers-roadmap-gh"; name = "Deep-Learning-Papers-Roadmap-gh"; slug = "deep-learning-papers-roadmap-gh"
        description = "Roadmap lectura papers DL ordenado"
        url = "https://github.com/floodsung/Deep-Learning-Papers-Reading-Roadmap"
        tags = @("ai","development","github")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "sutskever-reading-gh"; name = "sutskever-reading-gh"; slug = "sutskever-reading-gh"
        description = "Lecturas recomendadas Ilya Sutskever"
        url = "https://github.com/dzyim/ilya-sutskever-recommended-reading"
        tags = @("ai","development","github","model")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "exercises-dataset-gh"; name = "exercises-dataset-gh"; slug = "exercises-dataset-gh"
        description = "Dataset ejercicios programacion ML"
        url = "https://github.com/hasaneyldrm/exercises-dataset"
        tags = @("ai","development","github")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "awesome-gpu-engineering-gh"; name = "awesome-gpu-engineering-gh"; slug = "awesome-gpu-engineering-gh"
        description = "Recursos ingenieria GPU y CUDA"
        url = "https://github.com/goabiaryan/awesome-gpu-engineering"
        tags = @("ai","development","github")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "dl-acm-paper"; name = "dl-acm-paper"; slug = "dl-acm-paper"
        description = "Paper ACM digital library DL 2025"
        url = "https://dl.acm.org/doi/epdf/10.1145/3736227.3736235"
        tags = @("ai","development","model")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "onnxruntime"; name = "onnxruntime"; slug = "onnxruntime"
        description = "Inferencia ML cross-platform ONNX"
        url = "https://onnxruntime.ai/"
        tags = @("ai","development","model","open-source")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "tensorflow-js"; name = "tensorflow-js"; slug = "tensorflow-js"
        description = "ML en navegador y Node.js con TF.js"
        url = "https://www.tensorflow.org/js?hl=es"
        tags = @("ai","development","model","open-source")
        pricing = "free"; languages = @("en","es"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "leetcuda-gh"; name = "LeetCUDA-gh"; slug = "leetcuda-gh"
        description = "Ejercicios CUDA estilo LeetCode"
        url = "https://github.com/xlite-dev/LeetCUDA"
        tags = @("ai","development","github")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "llamafactory-gh"; name = "LlamaFactory-gh"; slug = "llamafactory-gh"
        description = "Fine-tuning LLMs unificado y eficiente"
        url = "https://github.com/hiyouga/LlamaFactory"
        tags = @("ai","development","github","llm","open-source")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "axolotl-gh"; name = "axolotl-gh"; slug = "axolotl-gh"
        description = "Fine-tuning LLMs simplificado cloud-native"
        url = "https://github.com/axolotl-ai-cloud/axolotl"
        tags = @("ai","development","github","llm")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "unsloth-studio-colab"; name = "Unsloth-Studio-Colab"; slug = "unsloth-studio-colab"
        description = "Fine-tuning y studio Unsloth en Colab"
        url = "https://colab.research.google.com/github/unslothai/unsloth/blob/main/studio/Unsloth_Studio_Colab.ipynb"
        tags = @("ai","development","llm","freemium")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "unsloth-start-doc"; name = "unsloth-start-doc"; slug = "unsloth-start-doc"
        description = "Guia inicio rapido Unsloth Studio"
        url = "https://unsloth.ai/docs/new/studio/start"
        tags = @("ai","development","llm","freemium")
        pricing = "freemium"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $false
        category = "ai"; subcategory = "development"
    },
    @{
        id = "unsloth-install-doc"; name = "unsloth-install-doc"; slug = "unsloth-install-doc"
        description = "Guia instalacion Unsloth Studio"
        url = "https://unsloth.ai/docs/new/studio/install"
        tags = @("ai","development","llm","freemium")
        pricing = "freemium"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $false
        category = "ai"; subcategory = "development"
    },
    @{
        id = "unlimited-ocr-gh"; name = "Unlimited-OCR-gh"; slug = "unlimited-ocr-gh"
        description = "OCR avanzado sin limites Baidu"
        url = "https://github.com/baidu/Unlimited-OCR"
        tags = @("ai","development","github","china")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "tesseract-ocr-gh"; name = "Tesseract-OCR-gh"; slug = "tesseract-ocr-gh"
        description = "Motor OCR open source clasico"
        url = "https://github.com/tesseract-ocr/tesseract"
        tags = @("ai","development","github","open-source")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "litert-js-gh"; name = "LiteRT-JS-gh"; slug = "litert-js-gh"
        description = "Inferencia ML LiteRT en browser JS"
        url = "https://github.com/google-ai-edge/LiteRT/tree/main/litert/js"
        tags = @("ai","development","github","model")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "qwen36-nvfp4-hf"; name = "Qwen3.6-NVFP4-hf"; slug = "qwen36-nvfp4-hf"
        description = "Qwen 3.6 27B cuantizado NVFP4"
        url = "https://huggingface.co/nvidia/Qwen3.6-27B-NVFP4"
        tags = @("ai","development","huggingface","model","llm")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "fugusashi-router-hf"; name = "fugusashi-router-hf"; slug = "fugusashi-router-hf"
        description = "Router LLM Fugusashi open source"
        url = "https://huggingface.co/eulogik/fugusashi-router"
        tags = @("ai","development","huggingface","llm")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "pollo-ai"; name = "pollo-ai"; slug = "pollo-ai"
        description = "Generacion video IA en un clic"
        url = "https://pollo.ai/invitation-landing"
        tags = @("ai","development","video","freemium")
        pricing = "freemium"; languages = @("en"); limits = "freemium"; verified = $true; noCreditCard = $false
        category = "ai"; subcategory = "development"
    },
    @{
        id = "loop-library"; name = "loop-library"; slug = "loop-library"
        description = "Biblioteca loops y samples audio IA"
        url = "https://signals.forwardfuture.com/loop-library/"
        tags = @("ai","development","audio")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    }
)

# --- ia_asistentes-desarrollo-china-imagen_1 → ai → assistants (14 links) ---
$aiAgentLinks = @(
    @{
        id = "hiraki-gh"; name = "hiraki-gh"; slug = "hiraki-gh"
        description = "Plataforma agentes IA descentralizada"
        url = "https://github.com/ddoemonn/hiraki.git"
        tags = @("ai","development","github","agent")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "semantica-gh"; name = "semantica-gh"; slug = "semantica-gh"
        description = "Framework agentes IA semanticos"
        url = "https://github.com/semantica-agi/semantica"
        tags = @("ai","development","github","agent")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "swarms-gh"; name = "swarms-gh"; slug = "swarms-gh"
        description = "Orquestacion multi-agente escalable"
        url = "https://github.com/kyegomez/swarms"
        tags = @("ai","development","github","agent")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "agentuniverse-gh"; name = "agentUniverse-gh"; slug = "agentuniverse-gh"
        description = "Framework multi-agente empresarial"
        url = "https://github.com/agentuniverse-ai/agentUniverse"
        tags = @("ai","development","github","agent")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "agent-framework-gh"; name = "agent-framework-gh"; slug = "agent-framework-gh"
        description = "Microsoft Agent Framework oficial"
        url = "https://github.com/microsoft/agent-framework"
        tags = @("ai","development","github","agent")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "langchain-gh"; name = "langchain-gh"; slug = "langchain-gh"
        description = "Framework LLM apps con cadenas y agentes"
        url = "https://github.com/langchain-ai/langchain"
        tags = @("ai","development","github","agent","llm","open-source")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "openwiki-gh"; name = "openwiki-gh"; slug = "openwiki-gh"
        description = "Wiki abierta colaborativa LangChain"
        url = "https://github.com/langchain-ai/openwiki.git"
        tags = @("ai","development","github","agent")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "muxi-gh"; name = "muxi-gh"; slug = "muxi-gh"
        description = "Multi-agente ligero extensible"
        url = "https://github.com/ranaroussi/muxi"
        tags = @("ai","development","github","agent")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "cmux-gh"; name = "cmux-gh"; slug = "cmux-gh"
        description = "Multi-agente con contexto compartido"
        url = "https://github.com/manaflow-ai/cmux.git"
        tags = @("ai","development","github","agent")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "meetily-gh"; name = "meetily-gh"; slug = "meetily-gh"
        description = "Agente IA para reuniones y notas"
        url = "https://github.com/Zackriya-Solutions/meetily"
        tags = @("ai","development","github","agent")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "fugu-gh"; name = "Fugu-gh"; slug = "fugu-gh"
        description = "Agentes IA Sakana AI Fugu"
        url = "https://github.com/SakanaAI/Fugu"
        tags = @("ai","development","github","agent")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "openfugu-gh"; name = "OpenFugu-gh"; slug = "openfugu-gh"
        description = "Implementacion abierta Fugu agentes"
        url = "https://github.com/trotsky1997/OpenFugu"
        tags = @("ai","development","github","agent","open-source")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "limen-gh"; name = "limen-gh"; slug = "limen-gh"
        description = "Plataforma agentes IA Limes Labs"
        url = "https://github.com/Limes-Labs/limen"
        tags = @("ai","development","github","agent")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    },
    @{
        id = "clawcodex-gh"; name = "clawcodex-gh"; slug = "clawcodex-gh"
        description = "Agente coding autonomo avanzado"
        url = "https://github.com/agentforce314/clawcodex"
        tags = @("ai","development","github","agent","coding")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "ai"; subcategory = "development"
    }
)

# --- diseno-ui-ux_desarrollo_ide → development → tools (15 links) ---
$devToolLinks = @(
    @{
        id = "aider-web"; name = "aider-web"; slug = "aider-web"
        description = "Asistente coding AI CLI pair programming"
        url = "https://aider.chat/"
        tags = @("development","tools","ide","y-desarrollo-ide")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    },
    @{
        id = "aider-guia"; name = "aider-guia"; slug = "aider-guia"
        description = "Guia completa Aider AI en espanol"
        url = "https://apidog.com/es/blog/aider-ai-2/"
        tags = @("development","tools","y-desarrollo-ide","desarrollo-ide")
        pricing = "free"; languages = @("es"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    },
    @{
        id = "aider-gh"; name = "aider-gh"; slug = "aider-gh"
        description = "Repo oficial Aider AI coding agent"
        url = "https://github.com/aider-ai/aider"
        tags = @("development","tools","ide","y-desarrollo-ide","ia-para-desarrollo")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    },
    @{
        id = "repomix-web"; name = "repomix-web"; slug = "repomix-web"
        description = "Empaqueta repos en un solo archivo AI"
        url = "https://repomix.com/"
        tags = @("development","tools","y-desarrollo-ide","ia-para-desarrollo")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    },
    @{
        id = "repomix-guide"; name = "repomix-guide"; slug = "repomix-guide"
        description = "Guia Repomix en espanol"
        url = "https://repomix.com/es/guide/"
        tags = @("development","tools","y-desarrollo-ide","desarrollo-ide")
        pricing = "free"; languages = @("es"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    },
    @{
        id = "repomix-dev-article"; name = "repomix-dev-article"; slug = "repomix-dev-article"
        description = "Articulo Repopack tool Node.js"
        url = "https://dev.to/yamadashy/repopack-a-simple-nodejs-tool-for-combining-repository-files-4o0d"
        tags = @("development","tools","y-desarrollo-ide")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    },
    @{
        id = "repomix-issue-325"; name = "repomix-issue-325"; slug = "repomix-issue-325"
        description = "Issue #325 Repomix GitHub tracker"
        url = "https://github.com/yamadashy/repomix/issues/325"
        tags = @("development","tools","y-desarrollo-ide")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    },
    @{
        id = "nvm-windows-gh"; name = "nvm-windows-gh"; slug = "nvm-windows-gh"
        description = "Node Version Manager para Windows"
        url = "https://github.com/coreybutler/nvm-windows"
        tags = @("development","tools","ide","y-desarrollo-ide")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    },
    @{
        id = "nvm-guide"; name = "nvm-guide"; slug = "nvm-guide"
        description = "Guia descarga e instalacion NVM"
        url = "https://www.nvmnode.com/es/guide/download.html"
        tags = @("development","tools","desarrollo-ide")
        pricing = "free"; languages = @("es"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    },
    @{
        id = "volta"; name = "volta"; slug = "volta"
        description = "Gestor versiones JS rapido y portable"
        url = "https://volta.sh/"
        tags = @("development","tools","ide","y-desarrollo-ide")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    },
    @{
        id = "docusaurus"; name = "docusaurus"; slug = "docusaurus"
        description = "Generador sitios documentacion React"
        url = "https://docusaurus.io/"
        tags = @("development","tools","y-desarrollo-ide","react")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    },
    @{
        id = "vitepress"; name = "vitepress"; slug = "vitepress"
        description = "Generador docs estatico con Vite"
        url = "https://vitepress.dev/"
        tags = @("development","tools","y-desarrollo-ide")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    },
    @{
        id = "mintlify-docs-gen"; name = "mintlify-docs-gen"; slug = "mintlify-docs-gen"
        description = "Auto-generar docs desde repositorios"
        url = "https://www.mintlify.com/blog/auto-generate-docs-from-repos"
        tags = @("development","tools","y-desarrollo-ide")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    },
    @{
        id = "deepwiki"; name = "deepwiki"; slug = "deepwiki"
        description = "Wiki automatica desde codigo fuente"
        url = "https://deepwiki.directory/"
        tags = @("development","tools","y-desarrollo-ide")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    },
    @{
        id = "gitfut"; name = "gitfut"; slug = "gitfut"
        description = "Visualizacion futurista actividad Git"
        url = "https://gitfut.com/"
        tags = @("development","tools","y-desarrollo-ide")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "tools"
    }
)

# --- diseno-ui-ux_desarrollo_ide → development → react-stack (2 links) ---
$reactLinks = @(
    @{
        id = "react-doctor-web"; name = "react-doctor-web"; slug = "react-doctor-web"
        description = "Diagnostico y optimizacion React"
        url = "https://www.webreactiva.com/blog/react-doctor"
        tags = @("development","react","y-desarrollo-ide","desarrollo-ide")
        pricing = "free"; languages = @("es"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "react-stack"
    },
    @{
        id = "react-doctor-gh"; name = "react-doctor-gh"; slug = "react-doctor-gh"
        description = "Herramienta diagnostico React apps"
        url = "https://github.com/millionco/react-doctor"
        tags = @("development","react","y-desarrollo-ide")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "react-stack"
    }
)

# --- diseno-ui-ux_desarrollo_ide → development → frameworks (1 link) ---
$fwLinks = @(
    @{
        id = "tinyrouter-gh"; name = "tinyrouter-gh"; slug = "tinyrouter-gh"
        description = "Router HTTP minimalista y rapido"
        url = "https://github.com/harrrshall/tinyrouter"
        tags = @("development","y-desarrollo-ide")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "development"; subcategory = "frameworks"
    }
)

# --- diseno-ui-ux_desarrollo_ide → design → inspiration (2 links) ---
$designLinks = @(
    @{
        id = "subframe"; name = "subframe"; slug = "subframe"
        description = "Diseno UI con IA a codigo real"
        url = "https://www.subframe.com/"
        tags = @("design","inspiration","yz-disea-o-ui-ux","ui")
        pricing = "freemium"; languages = @("en"); limits = "freemium"; verified = $true; noCreditCard = $false
        category = "design"; subcategory = "inspiration"
    },
    @{
        id = "builder-io"; name = "builder-io"; slug = "builder-io"
        description = "Headless CMS visual con IA integrada"
        url = "https://www.builder.io/"
        tags = @("design","inspiration","yz-disea-o-ui-ux","ui")
        pricing = "freemium"; languages = @("en"); limits = "freemium"; verified = $true; noCreditCard = $false
        category = "design"; subcategory = "inspiration"
    }
)

# --- utilidades_1 → utilities → productivity (2 links) ---
$utilLinks = @(
    @{
        id = "perthirtysix-qr"; name = "perthirtysix-qr"; slug = "perthirtysix-qr"
        description = "Como funcionan los codigos QR"
        url = "https://perthirtysix.com/how-the-heck-do-qr-codes-work"
        tags = @("productivity","utilities","y-utilidades-herramientas","tools")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "utilities"; subcategory = "productivity"
    },
    @{
        id = "reicon-gh"; name = "reicon-gh"; slug = "reicon-gh"
        description = "Reconstruye iconos Windows rotos"
        url = "https://github.com/dqev/reicon.git"
        tags = @("productivity","utilities","y-utilidades-herramientas","github")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "utilities"; subcategory = "productivity"
    }
)

# --- pagos_game-dev_mobile → payments → jobs (1 link) ---
$jobLinks = @(
    @{
        id = "ai-job-search-gh"; name = "ai-job-search-gh"; slug = "ai-job-search-gh"
        description = "Busqueda empleo automatizada con IA"
        url = "https://github.com/MadsLorentzen/ai-job-search.git"
        tags = @("jobs","monetizacion-empleo","github","ai")
        pricing = "free"; languages = @("en"); limits = "no-limits"; verified = $true; noCreditCard = $true
        category = "payments"; subcategory = "jobs"
    }
)

Write-Host "Total links defined: $($eduLinks.Count + $secLinks.Count + $aiDevLinks.Count + $aiAgentLinks.Count + $devToolLinks.Count + $reactLinks.Count + $fwLinks.Count + $designLinks.Count + $utilLinks.Count + $jobLinks.Count)"

# ============================================================
# INSERT FUNCTION
# ============================================================
function Insert-Resources {
    param($FilePath, $NewResources, $CategoryId, $SubcategoryId)
    
    $json = Get-Content $FilePath -Raw -Encoding UTF8 | ConvertFrom-Json
    
    # Filter resources that don't already exist
    $existingUrls = @{}
    foreach ($r in $json.resources) { $existingUrls[$r.url.TrimEnd('/').ToLower()] = $true }
    
    $toAdd = @()
    foreach ($r in $NewResources) {
        $norm = $r.url.TrimEnd('/').ToLower()
        if (-not $existingUrls.ContainsKey($norm)) {
            # Build searchIndex
            $si = @($r.name, $r.slug, $r.description) + $r.tags + $r.category + $r.subcategory
            $resource = [PSCustomObject]@{
                id = $r.id; name = $r.name; slug = $r.slug
                description = $r.description; url = $r.url; status = "active"
                tags = $r.tags; searchIndex = @($si | Select-Object -Unique)
                category = $r.category; subcategory = $r.subcategory
                pricing = $r.pricing; languages = $r.languages; limits = $r.limits
                added = $addedDate; verified = $r.verified; noCreditCard = $r.noCreditCard
            }
            $toAdd += $resource
        } else {
            Write-Host "  SKIP (dup): $($r.id)"
        }
    }
    
    if ($toAdd.Count -eq 0) {
        Write-Host "  No new resources to add for $FilePath"
        return 0
    }
    
    # Add to resources array
    $json.resources = @($json.resources) + $toAdd
    
    # Update category resourceCount
    $cats = if ($json.categories -is [array]) { $json.categories } else { @($json.categories) }
    foreach ($cat in $cats) {
        if ($cat.id -eq $CategoryId) { $cat.resourceCount = [int]$cat.resourceCount + $toAdd.Count }
    }
    
    # Update subcategory resourceCount
    foreach ($sub in $json.subcategories) {
        if ($sub.id -eq $SubcategoryId) { $sub.resourceCount = [int]$sub.resourceCount + $toAdd.Count }
    }
    
    # Save
    $json | ConvertTo-Json -Depth 6 -Compress:$false | Out-File $FilePath -Encoding UTF8 -NoNewline
    Write-Host "  INSERTED: $($toAdd.Count) resources into $FilePath"
    return $toAdd.Count
}

# ============================================================
# EXECUTE INSERTS
# ============================================================
$totalInserted = 0

Write-Host "`n--- dns_seguridad_educacion (education-learning) ---"
$totalInserted += Insert-Resources "$base\src\data\dates\dns_seguridad_educacion\dns_seguridad_educacion-rec.json" $eduLinks "education-learning" "programming-courses"

Write-Host "`n--- dns_seguridad_educacion (security-vpn) ---"
$totalInserted += Insert-Resources "$base\src\data\dates\dns_seguridad_educacion\dns_seguridad_educacion-rec.json" $secLinks "security-vpn" "security-auth"

Write-Host "`n--- ia_asistentes-desarrollo-china-imagen_1 (ai development) ---"
$aiAll = @($aiDevLinks) + @($aiAgentLinks)
$totalInserted += Insert-Resources "$base\src\data\dates\ia_asistentes-desarrollo-china-imagen_1\ia_asistentes-desarrollo-china-imagen_1-rec.json" $aiAll "ai" "development"

Write-Host "`n--- diseno-ui-ux_desarrollo_ide (development tools) ---"
$totalInserted += Insert-Resources "$base\src\data\dates\diseno-ui-ux_desarrollo_ide\diseno-ui-ux_desarrollo_ide-rec.json" $devToolLinks "development" "tools"

Write-Host "`n--- diseno-ui-ux_desarrollo_ide (development react-stack) ---"
$totalInserted += Insert-Resources "$base\src\data\dates\diseno-ui-ux_desarrollo_ide\diseno-ui-ux_desarrollo_ide-rec.json" $reactLinks "development" "react-stack"

Write-Host "`n--- diseno-ui-ux_desarrollo_ide (development frameworks) ---"
$totalInserted += Insert-Resources "$base\src\data\dates\diseno-ui-ux_desarrollo_ide\diseno-ui-ux_desarrollo_ide-rec.json" $fwLinks "development" "frameworks"

Write-Host "`n--- diseno-ui-ux_desarrollo_ide (design inspiration) ---"
$totalInserted += Insert-Resources "$base\src\data\dates\diseno-ui-ux_desarrollo_ide\diseno-ui-ux_desarrollo_ide-rec.json" $designLinks "design" "inspiration"

Write-Host "`n--- utilidades_1 (productivity) ---"
$totalInserted += Insert-Resources "$base\src\data\dates\utilidades_1\utilidades_1-rec.json" $utilLinks "utilities" "productivity"

Write-Host "`n--- pagos_game-dev_mobile (jobs) ---"
$totalInserted += Insert-Resources "$base\src\data\dates\pagos_game-dev_mobile\pagos_game-dev_mobile-rec.json" $jobLinks "payments" "jobs"

Write-Host "`n============================================"
Write-Host "TOTAL INSERTED: $totalInserted"
Write-Host "============================================"
