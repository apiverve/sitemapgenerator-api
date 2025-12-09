// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     SitemapGeneratorData data = Converter.fromJsonString(jsonString);

package com.apiverve.sitemapgenerator.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static SitemapGeneratorData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(SitemapGeneratorData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(SitemapGeneratorData.class);
        writer = mapper.writerFor(SitemapGeneratorData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// SitemapGeneratorData.java

package com.apiverve.sitemapgenerator.data;

import com.fasterxml.jackson.annotation.*;

public class SitemapGeneratorData {
    private String sitemap;
    private long urlCount;
    private long sizeBytes;
    private double sizeKB;
    private String format;
    private String protocol;
    private Settings settings;

    @JsonProperty("sitemap")
    public String getSitemap() { return sitemap; }
    @JsonProperty("sitemap")
    public void setSitemap(String value) { this.sitemap = value; }

    @JsonProperty("urlCount")
    public long getURLCount() { return urlCount; }
    @JsonProperty("urlCount")
    public void setURLCount(long value) { this.urlCount = value; }

    @JsonProperty("sizeBytes")
    public long getSizeBytes() { return sizeBytes; }
    @JsonProperty("sizeBytes")
    public void setSizeBytes(long value) { this.sizeBytes = value; }

    @JsonProperty("sizeKb")
    public double getSizeKB() { return sizeKB; }
    @JsonProperty("sizeKb")
    public void setSizeKB(double value) { this.sizeKB = value; }

    @JsonProperty("format")
    public String getFormat() { return format; }
    @JsonProperty("format")
    public void setFormat(String value) { this.format = value; }

    @JsonProperty("protocol")
    public String getProtocol() { return protocol; }
    @JsonProperty("protocol")
    public void setProtocol(String value) { this.protocol = value; }

    @JsonProperty("settings")
    public Settings getSettings() { return settings; }
    @JsonProperty("settings")
    public void setSettings(Settings value) { this.settings = value; }
}

// Settings.java

package com.apiverve.sitemapgenerator.data;

import com.fasterxml.jackson.annotation.*;

public class Settings {
    private String defaultChangeFreq;
    private double defaultPriority;
    private boolean includeLastMod;
    private String baseURL;

    @JsonProperty("defaultChangeFreq")
    public String getDefaultChangeFreq() { return defaultChangeFreq; }
    @JsonProperty("defaultChangeFreq")
    public void setDefaultChangeFreq(String value) { this.defaultChangeFreq = value; }

    @JsonProperty("defaultPriority")
    public double getDefaultPriority() { return defaultPriority; }
    @JsonProperty("defaultPriority")
    public void setDefaultPriority(double value) { this.defaultPriority = value; }

    @JsonProperty("includeLastMod")
    public boolean getIncludeLastMod() { return includeLastMod; }
    @JsonProperty("includeLastMod")
    public void setIncludeLastMod(boolean value) { this.includeLastMod = value; }

    @JsonProperty("baseUrl")
    public String getBaseURL() { return baseURL; }
    @JsonProperty("baseUrl")
    public void setBaseURL(String value) { this.baseURL = value; }
}