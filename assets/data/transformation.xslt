<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="yes"/>

    <xsl:template match="/">
        <xsl:text>{&#xa;</xsl:text>
        <xsl:text>"zdravotniCentrum": {&#xa;</xsl:text>
        
        <!-- Základní informace -->
        <xsl:text>"id": "</xsl:text><xsl:value-of select="zdravotniCentrum/@id"/><xsl:text>",&#xa;</xsl:text>
        <xsl:text>"nazev": "</xsl:text><xsl:value-of select="zdravotniCentrum/nazev"/><xsl:text>",&#xa;</xsl:text>
        
        <!-- Vlastnosti centra -->
        <xsl:text>"vlastnosti": {&#xa;</xsl:text>
        <xsl:text>"pojistovna": </xsl:text><xsl:value-of select="zdravotniCentrum/@pojistovna"/><xsl:text>,&#xa;</xsl:text>
        <xsl:text>"bezbarierovy": </xsl:text><xsl:value-of select="zdravotniCentrum/@bezbarierovy"/><xsl:text>,&#xa;</xsl:text>
        <xsl:text>"akreditace": </xsl:text><xsl:value-of select="zdravotniCentrum/@akreditace"/><xsl:text>,&#xa;</xsl:text>
        <xsl:text>"parkovanizdarma": </xsl:text><xsl:value-of select="zdravotniCentrum/@parkovanizdarma"/><xsl:text>,&#xa;</xsl:text>
        <xsl:text>"wifi": </xsl:text><xsl:value-of select="zdravotniCentrum/@wifi"/><xsl:text>,&#xa;</xsl:text>
        <xsl:text>"detskykoutek": </xsl:text><xsl:value-of select="zdravotniCentrum/@detskykoutek"/><xsl:text>,&#xa;</xsl:text>
        <xsl:text>"obcerstveni": </xsl:text><xsl:value-of select="zdravotniCentrum/@obcerstveni"/><xsl:text>,&#xa;</xsl:text>
        <xsl:text>"onlineobjednani": </xsl:text><xsl:value-of select="zdravotniCentrum/@onlineobjednani"/><xsl:text>&#xa;</xsl:text>
        <xsl:text>},&#xa;</xsl:text>
        
        <!-- Adresa -->
        <xsl:text>"adresa": {&#xa;</xsl:text>
        <xsl:text>"ulice": "</xsl:text><xsl:value-of select="zdravotniCentrum/adresa/ulice"/><xsl:text>",&#xa;</xsl:text>
        <xsl:text>"mesto": "</xsl:text><xsl:value-of select="zdravotniCentrum/adresa/mesto"/><xsl:text>",&#xa;</xsl:text>
        <xsl:text>"psc": "</xsl:text><xsl:value-of select="zdravotniCentrum/adresa/psc"/><xsl:text>",&#xa;</xsl:text>
        <xsl:text>"kraj": "</xsl:text><xsl:value-of select="zdravotniCentrum/adresa/kraj"/><xsl:text>",&#xa;</xsl:text>
        <xsl:text>"gps": {&#xa;</xsl:text>
        <xsl:text>"latitude": </xsl:text><xsl:value-of select="zdravotniCentrum/adresa/gps/latitude"/><xsl:text>,&#xa;</xsl:text>
        <xsl:text>"longitude": </xsl:text><xsl:value-of select="zdravotniCentrum/adresa/gps/longitude"/><xsl:text>&#xa;</xsl:text>
        <xsl:text>}&#xa;</xsl:text>
        <xsl:text>},&#xa;</xsl:text>
        
        <!-- Kontaktní údaje -->
        <xsl:text>"kontakt": {&#xa;</xsl:text>
        <xsl:text>"telefon": "</xsl:text><xsl:value-of select="zdravotniCentrum/kontakt/telefon"/><xsl:text>",&#xa;</xsl:text>
        <xsl:text>"email": "</xsl:text><xsl:value-of select="zdravotniCentrum/kontakt/email"/><xsl:text>",&#xa;</xsl:text>
        <xsl:text>"web": "</xsl:text><xsl:value-of select="zdravotniCentrum/kontakt/web"/><xsl:text>",&#xa;</xsl:text>
        <xsl:text>"socialniSite": {&#xa;</xsl:text>
        <xsl:if test="zdravotniCentrum/kontakt/socialniSite/facebook">
            <xsl:text>"facebook": "</xsl:text><xsl:value-of select="zdravotniCentrum/kontakt/socialniSite/facebook"/><xsl:text>",&#xa;</xsl:text>
        </xsl:if>
        <xsl:if test="zdravotniCentrum/kontakt/socialniSite/instagram">
            <xsl:text>"instagram": "</xsl:text><xsl:value-of select="zdravotniCentrum/kontakt/socialniSite/instagram"/><xsl:text>",&#xa;</xsl:text>
        </xsl:if>
        <xsl:if test="zdravotniCentrum/kontakt/socialniSite/twitter">
            <xsl:text>"twitter": "</xsl:text><xsl:value-of select="zdravotniCentrum/kontakt/socialniSite/twitter"/><xsl:text>",&#xa;</xsl:text>
        </xsl:if>
        <xsl:if test="zdravotniCentrum/kontakt/socialniSite/linkedin">
            <xsl:text>"linkedin": "</xsl:text><xsl:value-of select="zdravotniCentrum/kontakt/socialniSite/linkedin"/><xsl:text>"&#xa;</xsl:text>
        </xsl:if>
        <xsl:text>}&#xa;</xsl:text>
        <xsl:text>},&#xa;</xsl:text>
        
        <!-- Otevírací doba -->
        <xsl:text>"oteviraciDoba": [&#xa;</xsl:text>
        <xsl:for-each select="zdravotniCentrum/oteviraciDoba/den">
            <xsl:sort select="@nazev" order="ascending" case-order="upper-first">
                <xsl:choose>
                    <xsl:when test="@nazev='Pondělí'">1</xsl:when>
                    <xsl:when test="@nazev='Úterý'">2</xsl:when>
                    <xsl:when test="@nazev='Středa'">3</xsl:when>
                    <xsl:when test="@nazev='Čtvrtek'">4</xsl:when>
                    <xsl:when test="@nazev='Pátek'">5</xsl:when>
                    <xsl:when test="@nazev='Sobota'">6</xsl:when>
                    <xsl:when test="@nazev='Neděle'">7</xsl:when>
                </xsl:choose>
            </xsl:sort>
            <xsl:text>{&#xa;</xsl:text>
            <xsl:text>"den": "</xsl:text><xsl:value-of select="@nazev"/><xsl:text>",&#xa;</xsl:text>
            <xsl:text>"otevreno": "</xsl:text><xsl:value-of select="otevreno"/><xsl:text>",&#xa;</xsl:text>
            <xsl:if test="zavreno">
                <xsl:text>"zavreno": "</xsl:text><xsl:value-of select="zavreno"/><xsl:text>",&#xa;</xsl:text>
            </xsl:if>
            <xsl:if test="poznamka">
                <xsl:text>"poznamka": "</xsl:text><xsl:value-of select="poznamka"/><xsl:text>"&#xa;</xsl:text>
            </xsl:if>
            <xsl:if test="not(poznamka)">
                <xsl:text>"poznamka": null&#xa;</xsl:text>
            </xsl:if>
            <xsl:text>}</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>,&#xa;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#xa;],&#xa;</xsl:text>
        
        <!-- Oddělení -->
        <xsl:text>"oddeleni": [&#xa;</xsl:text>
        <xsl:for-each select="zdravotniCentrum/oddeleni/oddeleniInfo">
            <xsl:text>{&#xa;</xsl:text>
            <xsl:text>"id": "</xsl:text><xsl:value-of select="@id"/><xsl:text>",&#xa;</xsl:text>
            <xsl:text>"nazev": "</xsl:text><xsl:value-of select="@nazev"/><xsl:text>",&#xa;</xsl:text>
            <xsl:text>"popis": "</xsl:text><xsl:value-of select="popis"/><xsl:text>",&#xa;</xsl:text>
            
            <xsl:text>"lekari": [&#xa;</xsl:text>
            <xsl:for-each select="lekar">
                <xsl:text>{&#xa;</xsl:text>
                <xsl:text>"jmeno": "</xsl:text><xsl:value-of select="jmeno"/><xsl:text>",&#xa;</xsl:text>
                <xsl:text>"prijmeni": "</xsl:text><xsl:value-of select="prijmeni"/><xsl:text>",&#xa;</xsl:text>
                <xsl:text>"titul": "</xsl:text><xsl:value-of select="titul"/><xsl:text>",&#xa;</xsl:text>
                <xsl:text>"specializace": "</xsl:text><xsl:value-of select="specializace"/><xsl:text>",&#xa;</xsl:text>
                <xsl:text>"kontakt": {&#xa;</xsl:text>
                <xsl:text>"telefon": "</xsl:text><xsl:value-of select="telefon"/><xsl:text>",&#xa;</xsl:text>
                <xsl:text>"email": "</xsl:text><xsl:value-of select="email"/><xsl:text>"&#xa;</xsl:text>
                <xsl:text>},&#xa;</xsl:text>
                <xsl:text>"dostupnost": [&#xa;</xsl:text>
                <xsl:for-each select="dostupnost/den">
                    <xsl:text>{&#xa;</xsl:text>
                    <xsl:text>"den": "</xsl:text><xsl:value-of select="@nazev"/><xsl:text>",&#xa;</xsl:text>
                    <xsl:text>"hodiny": "</xsl:text><xsl:value-of select="."/><xsl:text>"&#xa;</xsl:text>
                    <xsl:text>}</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>,&#xa;</xsl:text>
                    </xsl:if>
                </xsl:for-each>
                <xsl:text>&#xa;]&#xa;</xsl:text>
                <xsl:text>}</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>,&#xa;</xsl:text>
                </xsl:if>
            </xsl:for-each>
            <xsl:text>&#xa;],&#xa;</xsl:text>
            
            <xsl:text>"sluzby": [&#xa;</xsl:text>
            <xsl:for-each select="sluzby/sluzba">
                <xsl:sort select="@cena" data-type="number" order="ascending"/>
                <xsl:text>{&#xa;</xsl:text>
                <xsl:text>"id": "</xsl:text><xsl:value-of select="@id"/><xsl:text>",&#xa;</xsl:text>
                <xsl:text>"nazev": "</xsl:text><xsl:value-of select="@nazev"/><xsl:text>",&#xa;</xsl:text>
                <xsl:text>"popis": "</xsl:text><xsl:value-of select="popis"/><xsl:text>",&#xa;</xsl:text>
                <xsl:text>"cena": </xsl:text><xsl:value-of select="@cena"/><xsl:text>,&#xa;</xsl:text>
                <xsl:text>"pojistovna": </xsl:text><xsl:value-of select="@pojistovna"/><xsl:text>,&#xa;</xsl:text>
                <xsl:text>"trvani": </xsl:text><xsl:value-of select="trvani"/><xsl:text>&#xa;</xsl:text>
                <xsl:text>}</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>,&#xa;</xsl:text>
                </xsl:if>
            </xsl:for-each>
            <xsl:text>&#xa;]&#xa;</xsl:text>
            <xsl:text>}</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>,&#xa;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#xa;],&#xa;</xsl:text>
        
        <!-- Vybavení -->
        <xsl:text>"vybaveni": [&#xa;</xsl:text>
        <xsl:for-each select="zdravotniCentrum/vybaveni/pristroj">
            <xsl:text>{&#xa;</xsl:text>
            <xsl:text>"id": "</xsl:text><xsl:value-of select="@id"/><xsl:text>",&#xa;</xsl:text>
            <xsl:text>"nazev": "</xsl:text><xsl:value-of select="@nazev"/><xsl:text>",&#xa;</xsl:text>
            <xsl:text>"popis": "</xsl:text><xsl:value-of select="popis"/><xsl:text>",&#xa;</xsl:text>
            <xsl:text>"rok": </xsl:text><xsl:value-of select="rok"/><xsl:text>,&#xa;</xsl:text>
            <xsl:text>"vyrobce": "</xsl:text><xsl:value-of select="vyrobce"/><xsl:text>",&#xa;</xsl:text>
            <xsl:text>"oddeleni": "</xsl:text><xsl:value-of select="@oddeleni"/><xsl:text>"&#xa;</xsl:text>
            <xsl:text>}</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>,&#xa;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#xa;],&#xa;</xsl:text>
        
        <!-- Pojišťovny -->
        <xsl:text>"pojistovny": [&#xa;</xsl:text>
        <xsl:for-each select="zdravotniCentrum/pojistovny/pojistovna">
            <xsl:choose>
                <xsl:when test="@kod = '111'">
                    <xsl:text>{&#xa;</xsl:text>
                    <xsl:text>"id": "</xsl:text><xsl:value-of select="@id"/><xsl:text>",&#xa;</xsl:text>
                    <xsl:text>"kod": "</xsl:text><xsl:value-of select="@kod"/><xsl:text>",&#xa;</xsl:text>
                    <xsl:text>"nazev": "</xsl:text><xsl:value-of select="@nazev"/><xsl:text>",&#xa;</xsl:text>
                    <xsl:text>"smlouva": {&#xa;</xsl:text>
                    <xsl:text>"cislo": "</xsl:text><xsl:value-of select="smlouva/cislo"/><xsl:text>",&#xa;</xsl:text>
                    <xsl:text>"platnostOd": "</xsl:text><xsl:value-of select="smlouva/platnostOd"/><xsl:text>",&#xa;</xsl:text>
                    <xsl:text>"platnostDo": "</xsl:text><xsl:value-of select="smlouva/platnostDo"/><xsl:text>"&#xa;</xsl:text>
                    <xsl:text>}&#xa;</xsl:text>
                    <xsl:text>}</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>,&#xa;</xsl:text>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>{&#xa;</xsl:text>
                    <xsl:text>"id": "</xsl:text><xsl:value-of select="@id"/><xsl:text>",&#xa;</xsl:text>
                    <xsl:text>"kod": "</xsl:text><xsl:value-of select="@kod"/><xsl:text>",&#xa;</xsl:text>
                    <xsl:text>"nazev": "</xsl:text><xsl:value-of select="@nazev"/><xsl:text>",&#xa;</xsl:text>
                    <xsl:text>"smlouva": {&#xa;</xsl:text>
                    <xsl:text>"cislo": "</xsl:text><xsl:value-of select="smlouva/cislo"/><xsl:text>",&#xa;</xsl:text>
                    <xsl:text>"platnostOd": "</xsl:text><xsl:value-of select="smlouva/platnostOd"/><xsl:text>",&#xa;</xsl:text>
                    <xsl:text>"platnostDo": "</xsl:text><xsl:value-of select="smlouva/platnostDo"/><xsl:text>"&#xa;</xsl:text>
                    <xsl:text>}&#xa;</xsl:text>
                    <xsl:text>}</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>,&#xa;</xsl:text>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <xsl:text>&#xa;],&#xa;</xsl:text>
        
        <!-- Aktuality -->
        <xsl:text>"aktuality": [&#xa;</xsl:text>
        <xsl:for-each select="zdravotniCentrum/aktuality/aktualita">
            <xsl:sort select="@datum" order="descending"/>
            <xsl:text>{&#xa;</xsl:text>
            <xsl:text>"id": "</xsl:text><xsl:value-of select="@id"/><xsl:text>",&#xa;</xsl:text>
            <xsl:text>"datum": "</xsl:text><xsl:value-of select="@datum"/><xsl:text>",&#xa;</xsl:text>
            <xsl:text>"nadpis": "</xsl:text><xsl:value-of select="nadpis"/><xsl:text>",&#xa;</xsl:text>
            <xsl:text>"obsah": "</xsl:text><xsl:value-of select="obsah"/><xsl:text>",&#xa;</xsl:text>
            <xsl:text>"autor": "</xsl:text><xsl:value-of select="autor"/><xsl:text>"&#xa;</xsl:text>
            <xsl:text>}</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>,&#xa;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#xa;],&#xa;</xsl:text>
        
        <!-- Recenze -->
        <xsl:text>"recenze": [&#xa;</xsl:text>
        <xsl:for-each select="zdravotniCentrum/recenze/hodnoceni">
            <xsl:if test="@hvezdy &gt; 3">
                <xsl:text>{&#xa;</xsl:text>
                <xsl:text>"id": "</xsl:text><xsl:value-of select="@id"/><xsl:text>",&#xa;</xsl:text>
                <xsl:text>"datum": "</xsl:text><xsl:value-of select="@datum"/><xsl:text>",&#xa;</xsl:text>
                <xsl:text>"hvezdy": </xsl:text><xsl:value-of select="@hvezdy"/><xsl:text>,&#xa;</xsl:text>
                <xsl:text>"pacient": "</xsl:text><xsl:value-of select="pacient"/><xsl:text>",&#xa;</xsl:text>
                <xsl:text>"text": "</xsl:text><xsl:value-of select="text"/><xsl:text>",&#xa;</xsl:text>
                <xsl:text>"oddeleni": "</xsl:text><xsl:value-of select="oddeleni"/><xsl:text>"&#xa;</xsl:text>
                <xsl:text>}</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>,&#xa;</xsl:text>
                </xsl:if>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#xa;]&#xa;</xsl:text>
        
        <xsl:text>}&#xa;}</xsl:text>
    </xsl:template>
</xsl:stylesheet>
