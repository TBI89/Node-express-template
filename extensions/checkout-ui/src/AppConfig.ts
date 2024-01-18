class AppConfig {
    private static instance: AppConfig;
    private baseUrl: string;
    private storeName: string;
    private apiVersion: string;
  
    private constructor() {
      this.baseUrl = 'https://runtime-nissan-authorities-sell.trycloudflare.com';
      this.storeName = 'home-assignment-27'; 
      this.apiVersion = '2024-01'; 
    }
  
    static getInstance(): AppConfig {
      if (!AppConfig.instance) {
        AppConfig.instance = new AppConfig();
      }
      return AppConfig.instance;
    }
  
    getBaseUrl(): string {
      return this.baseUrl;
    }
  
    getStoreName(): string {
      return this.storeName;
    }
  
    getApiVersion(): string {
      return this.apiVersion;
    }
  }
  
  export default AppConfig;
  