# 📱 App de Contabilidade Pessoal

Este é um projeto pessoal de contabilidade feito com Flutter, estruturado como **monorepo com Melos**. A aplicação é modularizada por pacotes, com foco em arquitetura limpa e escalável. Inicialmente, o app salva dados localmente e não possui backend.

---

## 🗂 Estrutura do Repositório

```txt
apps/
└── finances/                # App principal Flutter

packages/
├── design_system/           # Tipografia, cores, componentes visuais reutilizáveis
├── core/                    # Temas, helpers, services genéricos (ex: logger, formatos)
└── features/
    ├── transactions/        # Lançamentos e controle de transações
    ├── dashboard/           # Tela inicial, gráficos e resumo financeiro
    └── categories/          # Organização por categorias de gastos
```

---

## 🧰 Stack Técnica

| Categoria                | Tecnologia       | Motivo da Escolha                                      |
|-------------------------|------------------|--------------------------------------------------------|
| Estado & DI             | Riverpod         | Modular, reativo, com suporte a escopo e testabilidade |
| Navegação               | GoRouter         | Oficial, declarativa, ideal para apps modulares       |
| HTTP (futuro)           | Dio              | Robusto, com interceptors, ótimo para escalar         |
| Armazenamento local     | Isar             | Banco NoSQL performático e fácil de usar               |
| Monorepo                | Melos            | Organização por pacotes e automação de tarefas        |

---

## 📦 Melos (`melos.yaml`)

```yaml
name: finances_workspace

packages:
  - apps/**
  - packages/**
  - packages/features/**

scripts:
  bootstrap:
    run: melos bootstrap

  format:
    run: melos exec -- dart format .

  analyze:
    run: melos exec -- dart analyze

  test:
    run: melos exec --fail-fast -- flutter test

  lint:
    run: melos exec -- flutter analyze .

  build_runner:
    run: melos exec --depends-on="build_runner" -- \
      flutter pub run build_runner build --delete-conflicting-outputs

  clean:
    run: melos exec -- flutter clean

  upgrade:
    run: melos exec -- flutter pub upgrade

  check:
    run: |
      melos run format
      melos run analyze
      melos run test
```

---

## 🔜 Próximos passos

1. Inicializar o projeto `apps/finances` com Flutter.
2. Criar os pacotes `design_system`, `core`, e `features/*` com `flutter create -t package`.
3. Definir `ThemeData`, tipografia, e cores no `design_system`.
4. Criar entidades e providers iniciais no `transactions`.
5. Configurar navegação com **GoRouter** centralizada no app.
6. Usar **Riverpod** como DI + state management.

---
