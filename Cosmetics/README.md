# Cosmetics Brand Analysis
<p>The cosmetics industry is a 50 billion-dollar-a-year business in the US alone. Cosmetics sales are even used as an indicator for economic recessions (i.e., the "lipstick index").</p>
<p>You are working for a cosmetics start-up that plans to launch a new line of organic products. The launch will focus on the following cosmetics categories: fragrances, makeup, and skincare. Your task is to find the average prices for four competitor brands across these three categories. </p>
<p>You will be using data collected from Sephora's global store in your analysis. However, there are some additional requirements before you can present the results:</p>
<ul>
<li>The data available is unprocessed as received from Sephora. The start-up requests the categories as follows:</li>
</ul>
<table>
<thead>
<tr>
<th>New category</th>
<th style="text-align:left;">Existing categories to reclassify</th>
</tr>
</thead>
<tbody>
<tr>
<td>Fragrance</td>
<td style="text-align:left;">Perfume, Cologne</td>
</tr>
<tr>
<td>Makeup</td>
<td style="text-align:left;">Eye Palettes, Lipstick, Highlighter, Foundation, Mascara, Eyeliner, Makeup, Eyeshadow</td>
</tr>
<tr>
<td>Skincare</td>
<td style="text-align:left;">Moisturizers, Face Serums, Face Wash &amp; Cleansers, Face Masks, Face Primer, Body Lotions &amp; Body Oils,  Lotions &amp; Oils</td>
</tr>
</tbody>
</table>
<ul>
<li><p>Currently, it is unclear who the primary competitors are. Find the top four brands by the combined number of fragrance, makeup, and skincare products produced.</p></li>
<li><p>Exclude any products containing the toxic ingredient "toluene" from your analysis. Assume products with no ingredient information do not contain "toluene".</p></li>
<li><p>Product prices should be compared in USD. Below are the conversions for currencies found in the dataset:</p>
<ul>
<li>1 EUR = 1.22 USD</li>
<li>1 GBP = 1.42 USD</li>
<li>1 Yen = 0.01 USD</li></ul></li>
</ul>
<hr>
<p><em>The datasets available are listed below:</em></p>
<p> The datasets used for this project has been modified compared to the orginal dataset on Kaggle </p>
<div style="background-color: #efebe4; color: #05192d; text-align:left; vertical-align: middle; padding: 15px 25px 15px 25px; line-height: 1.6;">
    <div style="font-size:16px"><b>datasets/cosmetics.csv - Catalogue of cosmetics products, including brand, category, price, and other characteristics</b>
    </div>
    <div>Source: <a href="https://www.kaggle.com/raghadalharbi/all-products-available-on-sephora-website/version/1">Kaggle</a></div>
<ul>
    <li><b>id: </b>The product id.</li>
    <li><b>brand: </b>The brand.</li>
    <li><b>category: </b>The category of product.</li>
    <li><b>name: </b>The name of the product.</li>
    <li><b>size: </b>The size of the product.</li>
    <li><b>price: </b>The price of the product (in various currencies).</li>
    <li><b>rating: </b>The consumer rating of the product.</li>
    <li><b>how_to_use: </b>Instructions for the product.</li>
    <li><b>online_only: </b>Whether or not the product is online-exclusive.</li>
    <li><b>limited_edition: </b>Whether or not the product is limited edition.</li>
</ul>
    </div>
<div style="background-color: #efebe4; color: #05192d; text-align:left; vertical-align: middle; padding: 15px 25px 15px 25px; line-height: 1.6; margin-top: 17px;">
    <div style="font-size:16px"><b>datasets/ingredients.txt - A tab-delimited file containing the product IDs and ingredients for products in the cosmetics dataset</b>
    </div>
    <div>Source: <a href="https://www.kaggle.com/raghadalharbi/all-products-available-on-sephora-website/version/1">Kaggle</a></div>
<ul>
    <li><b>product_id: </b>The product id (corresponding to the id column in the cosmetics dataset).</li>
    <li><b>ingredients: </b>The list of ingredients in the product.</li> 
</ul>
    </div>
<div style="background-color: #efebe4; color: #05192d; text-align:left; vertical-align: middle; padding: 15px 25px 15px 25px; line-height: 1.6; margin-top: 17px;">
    <div style="font-size:16px"><b>datasets/cosmetics_categories.csv - Table containing the sub and broad categories for recategorization</b>
    </div>
<ul>
    <li><b>sub_category: </b>The sub categories that exist in the cosmetics CSV that need to be recategorized.</li>
    <li><b>broad_category: </b>The corresponding broader category to which the sub_category belongs to and needs to be recategorized as.</li> 
</ul>
    </div>