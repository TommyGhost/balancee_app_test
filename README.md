# Balanceè Rewards Summary Page

## Project Overview

This project implements the **Rewards Summary Page** for the Balanceè mobile platform using Flutter. The page allows users to track their cashback earnings, view their transaction history, and cash out rewards through direct cashout or promo codes.

## Key Features

1. **Earnings Overview**: Displays the total cashback earned and the current available balance in a prominent card layout.
2. **Cashback History**: Shows a detailed list of past cashback transactions, including service name, transaction date, and amount earned.
3. **Cashout Options**:
   - **Direct Cashout**: Users can withdraw their cashback directly to their bank or apply it as a discount on their next service.
   - **Promo Codes**: Users can convert cashback into promo codes, which are displayed in a confirmation dialog after successful generation.

## Architecture

- **State Management**: Implemented using **Provider**, which is simple and effective for the MVVM architecture.
- **Service Locator**: **get_it** is used for dependency injection, making the app easily scalable and testable.
- **Networking**: **Dio** is used for API requests.

## Design Choices

- The UI is built around cards to make the Earnings Overview and Cashout options visually distinct and easy to navigate.
- **Modals** are used for cashout flows to keep the interaction smooth and non-intrusive. A toast message confirms successful withdrawals, while promo code generation ends with an alert dialog displaying the promo code.
- Colors and fonts are sourced from the Balanceè web app to maintain consistency.

## Challenges

- Designing the UI in Figma was a new experience but helped in achieving a clean, cohesive look for the app.
  
