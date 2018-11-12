<?xml version="1.0" ?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="q" />
    <xsl:output method="html" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" doctype-system="about:legacy-compat" />
        <xsl:template match="/">
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Final Project | Kyle A. Carter | ICT 4540 - XML &amp; Data in Application Development</title>
    <link href="https://fonts.googleapis.com/css?family=PT+Serif:400,400i,700,700i|Roboto:400,400i,500,500i,700,700i" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous" />
    <link rel="stylesheet" href="/css/css.css" />
</head>
<body>
    <div class="webpage">
        <nav><div class="container">
            <a href="/" rel="bookmark" class="fas fa-home"><span class="sr-only">Home</span></a>
            <form action="/" method="get">
                <div class="form-item form-type-search form-edit-zip">
                    <label class="visualy-hidden" for="zip">Enter a New York City Postal Code...</label>
                    <input type="search" placeholder="Postal Code..." name="q" id="zip"  />
                </div>
                <button type="submit" class="fas fa-search"><span class="sr-only">Submit</span></button>
            </form>
        </div></nav>
        <xsl:choose>
            <xsl:when test="$q">
                <header><div class="container">
                    <div class="wrapper"><h1>Demographic Statistics: <xsl:value-of select="$q"/></h1></div>
                </div></header>
                <main>
                    <article class="container">
                        <xsl:for-each select="response/row/row">
                            <xsl:if test="jurisdiction_name = $q">
                                <xsl:if test="count_participants &lt; 1">
                                    <p>There were no respondents for this postal code.</p>
                                </xsl:if>
                                <xsl:apply-templates select="." />
                            </xsl:if>
                        </xsl:for-each>
                    </article>
                </main>
            </xsl:when>
            <xsl:otherwise>
                <header><div class="container">
                    <div class="wrapper"><h1>Demographic Statistics By Zip Code</h1>
                    <p class="subhead">City of New York</p></div>
                </div></header>
                <div class="content"><div class="content-container">
                    <main><article class="main-container">
                        <h2>Demographic statistics broken down by zip code</h2>
                        <p>Select a postal code to learn more about the demographics.</p>
                        <nav><ul class="list-unstyled list-cards">
                            <xsl:for-each select="response/row/row">
                                <xsl:sort select="jurisdiction_name"/>
                                <xsl:apply-templates select="." />
                            </xsl:for-each>
                        </ul></nav>
                    </article></main>
                    <aside><div class="aside-container">
                        <section>
                            <h3>Data Source</h3>
                            <p>This data is provided by the <a href="" rel="bookmark" target="_blank">Data.Gov</a>.</p>
                            <ul class="list-unstyled list-meta">
                                <li class="meta-publisher"><span class="fas fa-landmark" role="icon" aria-hidden="true"></span> <strong>Contact:</strong> NYC OpenData</li>
                                <li class="meta-use"><i class="fas fa-globe-americas"></i> <strong><a href="https://project-open-data.cio.gov/v1.1/schema/#accessLevel" rel="bookmark" target="_blank">Public:</a></strong> This dataset is intended for public access and use.</li>
                                <li class="meta-info"><i class="fas fa-info-circle"></i> <strong>Non-Federal:</strong> This dataset is covered by different Terms of Use than Data.gov. <a href="https://www1.nyc.gov/home/terms-of-use.page" rel="bookmark" target="_blank">See Terms</a></li>
                                <li class="meta-license"><i class="far fa-file-alt"></i> <strong>License:</strong> No license information was provided.</li>
                            </ul>
                        </section>
                    </div></aside>
                </div></div>
            </xsl:otherwise>
        </xsl:choose>
        <footer><div class="container">
            <p>Copyright 2018 Kyle A. Carter</p>
            <ul class="list-inline">
                <li><a class="fab fa-github-alt" rel="bookmark" href="https://github.com/kylecarter"><span class="sr-only">GitHub</span></a></li>
                <li><a class="fab fa-linkedin-in" rel="bookmark" href="https://www.linkedin.com/in/kyle-carter-8425a369/"><span class="sr-only">LinkedIn</span></a></li>
                <li><a class="fab fa-twitter" rel="bookmark" href="https://twitter.com/kyleacarter"><span class="sr-only">Twitter</span></a></li>
            </ul>
        </div></footer>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <script src="/js/js.js"></script>
</body>
</html>
    </xsl:template>
    <xsl:template match="response/row/row">
        <xsl:if test="$q = ''"><xsl:choose>
            <xsl:when test="count_participants &gt; 0"><xsl:variable name="postal_code"><xsl:value-of select="jurisdiction_name" /></xsl:variable>
            <li>
                <xsl:variable name="count_pacific_islander">
                    <xsl:value-of select="count(
                        count_pacific_islander[number(.) &gt; 0]
                    )" />
                </xsl:variable>
                <xsl:variable name="count_hispanic_latino">
                    <xsl:value-of select="count(
                        count_hispanic_latino[number(.) &gt; 0]
                    )" />
                </xsl:variable>
                <xsl:variable name="count_american_indian">
                    <xsl:value-of select="count(
                        count_american_indian[number(.) &gt; 0]
                    )" />
                </xsl:variable>
                <xsl:variable name="count_asian_non_hispanic">
                    <xsl:value-of select="count(
                        count_asian_non_hispanic[number(.) &gt; 0]
                    )" />
                </xsl:variable>
                <xsl:variable name="count_white_non_hispanic">
                    <xsl:value-of select="count(
                        count_white_non_hispanic[number(.) &gt; 0]
                    )" />
                </xsl:variable>
                <xsl:variable name="count_black_non_hispanic">
                    <xsl:value-of select="count(
                        count_black_non_hispanic[number(.) &gt; 0]
                    )" />
                </xsl:variable>
                <xsl:variable name="count_other_ethnicity">
                    <xsl:value-of select="count(
                        count_other_ethnicity[number(.) &gt; 0]
                    )" />
                </xsl:variable>
                <xsl:variable name="count_demographics">
                    <xsl:value-of select="
                        $count_pacific_islander +
                        $count_hispanic_latino +
                        $count_american_indian +
                        $count_asian_non_hispanic +
                        $count_white_non_hispanic +
                        $count_black_non_hispanic +
                        $count_other_ethnicity
                    " />
                </xsl:variable>
                <h3><a href="/?q={$postal_code}" title="Learn more about {$postal_code}." rel="bookmark"><xsl:value-of select="$postal_code" /> <span class="fas fa-chevron-right" role="icon" aria-hidden="hidden"></span></a></h3>
                <p><strong><xsl:value-of select="count_participants" /></strong>respondents from <strong><xsl:value-of select="$count_demographics"/></strong>demographic[s].</p>
            </li></xsl:when><xsl:otherwise></xsl:otherwise>
        </xsl:choose></xsl:if>
        <xsl:if test="$q">
            <xsl:variable name="count_pacific_islander"><xsl:value-of select="count_pacific_islander" /></xsl:variable>
            <xsl:variable name="count_hispanic_latino"><xsl:value-of select="count_hispanic_latino" /></xsl:variable>
            <xsl:variable name="count_american_indian"><xsl:value-of select="count_american_indian" /></xsl:variable>
            <xsl:variable name="count_asian_non_hispanic"><xsl:value-of select="count_asian_non_hispanic" /></xsl:variable>
            <xsl:variable name="count_white_non_hispanic"><xsl:value-of select="count_white_non_hispanic" /></xsl:variable>
            <xsl:variable name="count_black_non_hispanic"><xsl:value-of select="count_black_non_hispanic" /></xsl:variable>
            <xsl:variable name="count_other_ethnicity"><xsl:value-of select="count_other_ethnicity" /></xsl:variable>
            <h2>Respondents by Demographic</h2>
            <div class="canvas">
                <canvas id="pie-chart"
                    data-pacific="{$count_pacific_islander}"
                    data-latino="{$count_hispanic_latino}"
                    data-indian="{$count_american_indian}"
                    data-asian="{$count_asian_non_hispanic}"
                    data-white="{$count_white_non_hispanic}"
                    data-black="{$count_black_non_hispanic}"
                    data-other="{$count_other_ethnicity}"
                ></canvas>
                <p class="canvas-caption"><strong>Total Participants:</strong> <xsl:value-of select="count_participants" /></p>
            </div>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>