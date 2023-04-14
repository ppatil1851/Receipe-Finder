<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
    <body>
        <h2><xsl:value-of select= "//description"/></h2>
        <table border= "2">
            <tr bgcolor= "#9acd32">
                <th>Recipes Id</th>
                <th>Date</th>
                <th>Title</th>
                <th>Ingredient</th>
                <th>Preparation</th>
                <th>Comment</th>
                <th>Nutrition</th>
                <th>Related</th>
            </tr>
            <xsl:for-each select = "//recipe">
                <tr>
                <td><xsl:value-of select= "@id"/></td>
                <td><xsl:value-of select= "date"/></td>
                <td><xsl:value-of select= "title"/></td>
                <td>
            <ol>
                <xsl:for-each select="ingredient">
                    <li>
                        <b>Name of Ingredient:</b> <xsl:value-of select="@name"/>
                        <br/>
                        <ul>
                        <xsl:for-each select="ingredient">
                            <li>
                            <xsl:choose><xsl:when test="@name"><b>Name:</b> <xsl:value-of select="@name"/><br/></xsl:when></xsl:choose>
                            <xsl:for-each select="ingredient">
                            <li>
                            <xsl:choose><xsl:when test="@name"><b>Name:</b> <xsl:value-of select="@name"/><br/></xsl:when></xsl:choose>
                            <ul>
                            <xsl:for-each select="ingredient">
                            <li>
                            <xsl:choose><xsl:when test="@name"><b>Name:</b> <xsl:value-of select="@name"/><br/></xsl:when></xsl:choose>
                            <xsl:choose><xsl:when test="@amount"><b>Amount: </b> <xsl:value-of select="@amount"/><br/></xsl:when></xsl:choose>
                            <xsl:choose><xsl:when test="@unit"><b>Unit:</b> <xsl:value-of select="@unit"/><br/></xsl:when></xsl:choose>
                            </li>
                            </xsl:for-each>
                            </ul>
                            <xsl:choose>
                        <xsl:when test="./preparation">
                            <b>Preparation:</b>
                            <ul>
                            <xsl:for-each select="preparation/step">
                                <li>
                                    <xsl:value-of select="." />
                                </li>
                            </xsl:for-each>
                            </ul>
                        </xsl:when>
                        </xsl:choose>
                            <xsl:choose><xsl:when test="@amount"><b>Amount: </b> <xsl:value-of select="@amount"/><br/></xsl:when></xsl:choose>
                            <xsl:choose><xsl:when test="@unit"><b>Unit:</b> <xsl:value-of select="@unit"/><br/></xsl:when></xsl:choose>
                            </li>
                            </xsl:for-each>
                            <xsl:choose><xsl:when test="@amount"><b>Amount: </b> <xsl:value-of select="@amount"/><br/></xsl:when></xsl:choose>
                            <xsl:choose><xsl:when test="@unit"><b>Unit:</b> <xsl:value-of select="@unit"/><br/></xsl:when></xsl:choose>
                            </li>
                        </xsl:for-each>
                        </ul>
                        <xsl:choose>
                        <xsl:when test="./preparation">
                        <b>Preparation:</b>
                            <ul>
                            <xsl:for-each select="preparation/step">
                                <li>
                                    <xsl:value-of select="." />
                                </li>
                            </xsl:for-each>
                            </ul>
                        </xsl:when>
                        </xsl:choose>
                        <br/>
                        <xsl:choose><xsl:when test="@amount"><b>Amount: </b> <xsl:value-of select="@amount"/><br/></xsl:when></xsl:choose>
                        <xsl:choose><xsl:when test="@unit"><b>Unit:</b> <xsl:value-of select="@unit"/><br/></xsl:when></xsl:choose>
                        <xsl:choose><xsl:when test="ingredient/preparation"><b>Preparation:</b><xsl:value-of select="ingredient/preparation"/><br/></xsl:when></xsl:choose>
                    </li><br/>
                </xsl:for-each>
            </ol>
            </td>
              <td>
              <ul>
                <xsl:for-each select="preparation/step">
                    <li>
                        <xsl:value-of select="." />
                    </li>
                </xsl:for-each>
            </ul>
            </td>
                <td><xsl:value-of select= "comment"/></td>
                <td>
                <xsl:for-each select="nutrition">
                <b>Calories:</b> <xsl:value-of select="@calories"/><br/>
                <b>Fat:</b> <xsl:value-of select="@fat"/><br/>
                <b>Carbohydrates:</b><xsl:value-of select="@carbohydrates"/><br/>
                <b>Protein:</b><xsl:value-of select="@protein"/><br/>
                </xsl:for-each>
                </td>
                <td><xsl:value-of select="related"/></td>
            </tr>
            </xsl:for-each>
        </table>
    </body>
</html>
</xsl:template>
</xsl:stylesheet>