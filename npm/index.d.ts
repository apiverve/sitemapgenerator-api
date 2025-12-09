declare module '@apiverve/sitemapgenerator' {
  export interface sitemapgeneratorOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface sitemapgeneratorResponse {
    status: string;
    error: string | null;
    data: SitemapGeneratorData;
    code?: number;
  }


  interface SitemapGeneratorData {
      sitemap:   string;
      urlCount:  number;
      sizeBytes: number;
      sizeKB:    number;
      format:    string;
      protocol:  string;
      settings:  Settings;
  }
  
  interface Settings {
      defaultChangeFreq: string;
      defaultPriority:   number;
      includeLastMod:    boolean;
      baseURL:           string;
  }

  export default class sitemapgeneratorWrapper {
    constructor(options: sitemapgeneratorOptions);

    execute(callback: (error: any, data: sitemapgeneratorResponse | null) => void): Promise<sitemapgeneratorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: sitemapgeneratorResponse | null) => void): Promise<sitemapgeneratorResponse>;
    execute(query?: Record<string, any>): Promise<sitemapgeneratorResponse>;
  }
}
