# 🎓 iOS Assignment Demo App  
### 👨‍💻 Built by Jai Nijhawan

---

## 🧠 The Story Behind It

When I first opened the original app, I was genuinely impressed by the **smooth launch**, the **vibrant visuals**, and most of all — the **immersive haptic feedback**.  
It was a subtle touch, but it made the whole experience feel *alive*. I wanted to recreate that exact same moment.

So for this assignment, I decided to go beyond just static UI and build something that **feels real** — both in visuals and interaction.

---

## 📱 About the Assignment

This demo app is a **SwiftUI-based recreation** of the original app's opening screen.

### What's Included:
- 🎬 A **launch video experience** with **custom-timed haptic feedback**
- 📸 A **carousel scroll view** with dynamic scale effects
- ⚪ A **custom page control view** (dots indicator)
- 📩 A styled **email input field** and CTA button
- ✅ The **exact assets** used in the original app for 1:1 visual fidelity

> ⚠️ Haptics are **not visible in the demo video**, but run it on a real iOS device to *feel* it!

---

## 📂 Project File Breakdown

| 🧾 File Name | 📌 Description |
|-------------|----------------|
| **`ContentView.swift`** | Main screen with logo, carousel, page control, email input & continue button |
| **`LaunchVideoView.swift`** | Plays splash `.mp4` video and triggers soft/rigid/interval haptics |
| **`CarouselItemView.swift`** | UI for each individual carousel item (image + title + checkmark) |
| **`CarouselScrollView.swift`** | Horizontal scroll view with scaling and `ScrollViewReader` logic |
| **`CarouselScrollViewModel.swift`** | `ObservableObject` managing carousel data and current index |
| **`CarouselItemData.swift`** | Simple model struct for each item in the carousel |
| **`CustomPageControlView.swift`** | Dots view to reflect current index in the carousel |
| **`RootView.swift`** | Launches video first, then transitions into `ContentView` |
| **`Jai_Nijhawan_AtlysApp.swift`** | App entry point using SwiftUI lifecycle |
| **`EmailTextField.swift`** | Custom reusable view for email input with stylized UI |
| **`ContinueButton.swift`** | Primary button styled as in original app |

---

## 🧪 Try It Yourself

1. Clone this repo
2. Open in **Xcode 15+**
3. Run the app on a **physical iOS device** (to feel haptics)
4. Enjoy the smooth launch, swipe through the carousel, and try the continue flow

---

## 🙋‍♂️ About Me

I'm **Jai Nijhawan** — a product-driven iOS developer passionate about crafting refined user experiences that *feel* delightful and meaningful.

🌐 [Portfolio Website](https://jainijhawan.github.io/)  
🔗 [LinkedIn](https://www.linkedin.com/in/jai-nijhawan/)

Feel free to connect or reach out — happy to chat about product, code, or craft! ✨

---
