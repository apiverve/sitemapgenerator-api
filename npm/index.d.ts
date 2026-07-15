declare module '@apiverve/sitemapgenerator' {
  export interface sitemapgeneratorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface sitemapgeneratorResponse {
    status: string;
    error: string | null;
    data: SitemapGeneratorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface SitemapGeneratorData {
      sitemap:   null | string;
      urlCount:  number | null;
      sizeBytes: number | null;
      sizeKB:    number | null;
      format:    null | string;
      protocol:  null | string;
      settings:  Settings;
  }
  
  interface Settings {
      defaultChangeFreq: null | string;
      defaultPriority:   number | null;
      includeLastMod:    boolean | null;
      baseURL:           null | string;
  }

  export default class sitemapgeneratorWrapper {
    constructor(options: sitemapgeneratorOptions);

    execute(callback: (error: any, data: sitemapgeneratorResponse | null) => void): Promise<sitemapgeneratorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: sitemapgeneratorResponse | null) => void): Promise<sitemapgeneratorResponse>;
    execute(query?: Record<string, any>): Promise<sitemapgeneratorResponse>;
  }
}
