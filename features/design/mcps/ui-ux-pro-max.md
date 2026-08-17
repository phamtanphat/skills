# UI UX Pro Max

> **118k ⭐** — AI skill chuyên về design intelligence, hỗ trợ Flutter, SwiftUI, Jetpack Compose.
> Repo: https://github.com/nextlevelbuilder/ui-ux-pro-max-skill | Website: https://uupm.cc

---

## Tính năng chính

- **79 searchable visual styles** — glassmorphism, neumorphism, Material 3, Fluent 2, Shopify Polaris...
- **Design System Generator** — tự sinh color palette, typography, spacing tokens theo domain (fintech, spa, e-commerce...)
- **Stack-specific guidelines** — mention stack trong prompt là AI apply đúng rules

## Stacks hỗ trợ (Mobile-relevant)

| Platform | Stack |
|---|---|
| Flutter | Cross-platform (Material 3 + custom) |
| iOS | SwiftUI + Liquid Glass |
| Android | Jetpack Compose + Material 3 |
| React Native | Cross-platform |

---

## Cài đặt trong project

### Option A — Claude Code / Antigravity
```bash
npx ui-ux-pro-max-cli init --ai claude
# Cài vào: .claude/skills/ui-ux-pro-max/
```

### Option B — Global (dùng cho mọi project)
```bash
npm install -g ui-ux-pro-max-cli
uipro init --ai claude --global
# Cài vào: ~/.claude/skills/ui-ux-pro-max/
```

### Option C — Cursor
```bash
uipro init --ai cursor
```

### Option D — Universal (tất cả AI)
```bash
uipro init --ai universal --global
# Cài vào: ~/.agents/skills/ui-ux-pro-max/
```

---

## Cách dùng trong prompt

```
# Gọi design system generator
"Design a fintech banking app UI using Flutter. Apply Material 3."

# Search style cụ thể
"Use glassmorphism style for this login screen in SwiftUI"

# Generate design tokens
"Generate a design system for a beauty spa app — colors, typography, spacing"
```

### CLI Search trực tiếp
```bash
# Tìm style
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "glassmorphism" --domain style

# Generate design system
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "fintech banking" --design-system -f markdown

# Flutter-specific
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "material 3 flutter" --stack flutter
```

---

## Cập nhật

```bash
uipro update          # Cập nhật cho project hiện tại
uipro update --global # Cập nhật global
```

## Gỡ cài đặt

```bash
uipro uninstall --ai claude
# hoặc xóa thủ công:
rm -rf .claude/skills/ui-ux-pro-max
```
