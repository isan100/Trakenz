# Unified Digital Asset Tracker (Ethereum)

### Problem

Users spread their digital assets (cryptocurrencies, NFTs, stablecoins/fiat on exchanges, tokenized assets) across many wallets and custodial exchanges. Tracking balances, current market value, and transaction history requires visiting multiple interfaces and aggregators. This leads to poor visibility, missed rebalancing opportunities, and higher operational/monitoring cost.

### Solution

A unified Web3-first dashboard (mobile + web) that links to user wallets (read-only via public addresses / wallet connect), integrates exchange API snapshots (user-provided API keys for custodial accounts, optional read-only), and pulls live prices from a crypto price aggregator. The system computes the aggregated portfolio value in user-selected fiat, displays historical P&L, supports NFT valuation using recent sales/collection floor prices, and issues alerts when assets change beyond thresholds.

### Benefits

- Single-pane-of-glass view for all digital holdings.
- Real-time valuations using market price feeds and NFT collection data.
- Improved portfolio decisions (rebalance, tax reporting, liquidation).
- Reduced friction: no need to log in to multiple exchanges/wallets to check balances.
- Audit trail of linked addresses and snapshots (on-chain registration + off-chain index).
- Privacy-first: by default the app reads public blockchain balances; custodial APIs are optional and encrypted.

### Key features

- Multi-wallet support (Ethereum addresses, Ledger/Trezor via WalletConnect, MetaMask).
- Custodial exchange integration (optional API key import with encryption).
- Live token pricing (aggregate from multiple price providers).
- NFT valuation (collection floor price + recent sales).
- Historical snapshots and charting (daily snapshots, exportable CSV).
- Alerts (price threshold, large transfers, suspicious activity).
- Role-based account (owner, read-only viewers).
- On-chain registration of "watchlist" addresses (opt-in) for decentralized verification.
- Privacy controls & data export.

### Workflow

1. User registers and optionally links wallets (public addresses) and custodial exchange API keys.
2. Backend indexers fetch on-chain balances for linked addresses, and custodial APIs return balances (if provided).
3. Price aggregator fetches live prices for tokens and NFTs.
4. Engine normalizes assets into canonical tokens, computes total portfolio value, and stores daily snapshots.
5. Frontend (web + mobile) visualizes holdings, historical charts, and alerts.
6. User actions (add/remove addresses, export, alert config) update system state.

### Tech stack

- **Frontend (React / React Native)**
- **Backend API (Node.js + Express / NestJS)**
- **Indexer / Worker (Node.js / Python)**
- **Price Aggregator Connector**
- **Database (Postgres + Redis)**
- **On-chain contracts (Solidity, Ethereum)**
- **Off-chain indexing & analytics (TheGraph or custom)**
- **Authentication & Wallet integration**
- **Encryption & Secrets (KMS / AWS Secrets Manager)**
- **Hosting / Infra**
- **Monitoring & Alerts**
