# Welcome to MenuVerse! 🌌🍔

Welcome to MenuVerse, where menus aren’t just lists—they’re adventures waiting to be explored! 🍔✨ From crafting sections to sprinkling modifiers like extra cheese or chocolate syrup, MenuVerse helps you manage every detail with style. Whether you’re a pizza perfectionist or a coffee connoisseur, this app has you covered. Ready to build your menu universe? Let’s get started! 🚀

## **Installation**

Follow these steps to get MenuVerse running on your local machine:

### **1. Clone the Repository**

```bash
git clone https://github.com/untung29/menu_verse.git
cd menu_verse
```

### 2. Install Dependencies

Ensure you have the following installed:

- Ruby: 3.3.6
- Rails: 8.0.0

Then, install the required gems:

```bash
bundle install
```

### 3. Set Up the Database

Create and seed the database:

```bash
rails db:create db:migrate db:seed
```

### 4. Start the server

```bash
rails server
```

## **🚀 Performance Metrics 🚀**

### Metrics Summary

#### Response Time

- Median (50th Percentile): 31 ms
- Minimum (95th Percentile): 2 ms
- Maximum (95th Percentile): 159 ms
  The response times are reasonable, though reducing the maximum response time would further enhance the application's performance.

#### Memory Usage

- Current Memory Usage: 21.8 MB
- Maximum Memory Usage: 111.5 MB
- Memory Quota: 512 MB

#### Throughput

- Requests Per Second (RPS): < 1 RPS
- No 5XX Errors observed.
  The low throughput reflects controlled testing conditions.
  Additional testing under higher loads can provide a clearer picture of performance.

### How we can improve?

### 1. Add Caching

Cache frequently accessed data (like menus and sections) to speed things up even more. We can use Rails.cache or Redis for this.

### 2. Monitor and Test

Use Heroku’s monitoring tools to watch for spikes in response times or memory usage.
Run load tests to simulate heavy traffic and spot potential bottlenecks.
