/*
==================================================
Business Question 1

Question:
Which app categories have the highest average ratings?

Business Value:
Identifying categories with the highest user ratings
helps businesses understand which markets have strong
customer satisfaction and where users value quality
the most.
==================================================
*/

SELECT
    Category,
    ROUND(AVG(Rating),2) AS avg_rating,
    COUNT(*) AS total_apps
FROM googleplaystore_clean
WHERE Rating IS NOT NULL
GROUP BY Category
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC;

/*
==================================================
Business Insight:

Categories with the highest average ratings EVENTS
markets where users are generally more satisfied with
the available applications. High ratings often indicate
better app quality, user experience, and customer trust.

Business Recommendation:

• Developers entering these categories should focus on
  maintaining high-quality features and user experience.

• Businesses can study these top-performing categories
  to understand what contributes to positive user reviews.

• Categories with consistently high ratings may offer
  opportunities for launching premium applications or
  expanding existing products.
==================================================
*/








/*
==================================================
Business Question 2

Question:
Which app categories have the highest total installs?

Business Value:
Understanding which categories generate the most
downloads helps businesses identify high-demand
markets and prioritize investment opportunities.
==================================================
*/

SELECT
    Category,
    SUM(installs_clean) AS total_installs
FROM googleplaystore_clean
GROUP BY Category
ORDER BY total_installs DESC;

/*
==================================================
Business Insight:

The GAME category has the highest total number of
installs, indicating that gaming applications have
the largest user reach on the Google Play Store.
Communication and Productivity apps also show
significant market demand, reflecting their importance
in users' daily activities.

Business Recommendation:

• Companies looking to maximize user acquisition
  should consider investing in high-demand categories
  such as Games and Communication.

• Since these categories are highly competitive,
  businesses should focus on innovation, user
  engagement, and unique features to stand out.

• Emerging developers may also explore growing
  categories with lower competition while adopting
  successful strategies from high-install categories.
==================================================
*/


/*
==================================================
Business Question 3

Question:
Do free apps receive better user ratings than paid apps?

Business Value:
Understanding the relationship between app pricing
and user ratings helps businesses choose an effective
monetization strategy while maintaining customer
satisfaction.
==================================================
*/

SELECT
    Type,
    COUNT(*) AS total_apps,
    ROUND(AVG(Rating),2) AS avg_rating
FROM googleplaystore_clean
WHERE Rating IS NOT NULL
GROUP BY Type;

/*
==================================================
Business Insight:

Paid apps have a higher average rating of 4.27
compared to free apps, which have an average rating
of 4.19.

This may suggest that users perceive paid apps as
providing better value or a higher-quality experience.
However, ratings alone do not explain the exact reason
for this difference.

Business Recommendation:

• Businesses should choose a pricing model based on
  their revenue strategy and target audience rather
  than assuming that free or paid apps will
  automatically receive better ratings.

• Developers should focus on app quality, performance,
  and user experience, as customer satisfaction depends
  on more than pricing alone.

• Companies should further analyze user reviews and
  customer feedback to identify the factors that
  influence app ratings and overall user satisfaction.
==================================================
*/




/*
==================================================
Business Question 4

Question:
Which app categories have the highest average app price?

Business Value:
Analyzing the average price by category helps
businesses identify markets where users are more
willing to purchase paid applications and supports
pricing strategy decisions.
==================================================
*/

SELECT
    Category,
    COUNT(*) AS total_paid_apps,
    ROUND(AVG(price_clean),2) AS avg_price
FROM googleplaystore_clean
WHERE Type = 'Paid'
GROUP BY Category
HAVING COUNT(*) >= 5
ORDER BY avg_price DESC;

/*
==================================================
Business Insight:

The Finance category has the highest
average app price of $17.64.

This indicates that users in this category may be
willing to pay more for specialized sevices and professional tools.

The Lifestyle category ranks second with
an average price of $124.26.

Business Recommendation:

• Businesses planning to launch paid applications
  should evaluate whether their category supports
  premium pricing.

• Developers should price their applications based
  on aap features and business value rather than
  following competitors blindly.

• Companies should also analyze customer demand,
  competition, and perceived value before setting
  higher prices.
==================================================
*/  




/*
==================================================
Business Question 5

Question:
Which app categories have both high average ratings
and high total installs?

Business Value:
Identifying categories that are both popular and
highly rated helps businesses discover attractive
markets with strong customer demand and satisfaction.
==================================================
*/

SELECT
    Category,
    ROUND(AVG(Rating),2) AS avg_rating,
    SUM(installs_clean) AS total_installs,
    COUNT(*) AS total_apps
FROM googleplaystore_clean
WHERE Rating IS NOT NULL
GROUP BY Category
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC, total_installs DESC;

/*
==================================================
Business Insight:

The Events category demonstrates both
strong user satisfaction with an average rating of
4.44 and high market demand with
15949410 total installs.

This suggests that the  event category successfully balances
quality and popularity, making it an attractive market
for developers.

Business Recommendation:

• Businesses should study successful apps in the
  Events category to understand what
  drives both user satisfaction and large-scale
  adoption.

• Developers should focus on delivering high-quality
  features while ensuring scalability to reach a
  broader audience.

• Companies entering this market should differentiate
  themselves through aap quility and good efficiency .
==================================================
*/


/*
==================================================
Business Question 6

Question:
Which paid apps are priced above the average price
of their respective category?

Business Value:
Identifying premium-priced apps helps businesses
understand pricing strategies within each category
and evaluate whether higher prices are common or
exceptional.
==================================================
*/

WITH category_price AS (
    SELECT
        Category,
        AVG(price_clean) AS avg_price
    FROM googleplaystore_clean
    WHERE Type = 'Paid'
    GROUP BY Category
)

SELECT
    g.App,
    g.Category,
    ROUND(g.price_clean,2) AS app_price,
    ROUND(c.avg_price,2) AS category_avg_price
FROM googleplaystore_clean g
JOIN category_price c
ON g.Category = c.Category
WHERE g.Type = 'Paid'
AND g.price_clean > c.avg_price
ORDER BY g.price_clean DESC;


/*
==================================================
Business Insight:

The app "I'm Rich - Trump Edition" is priced at
$400, which is significantly higher than the average
price of $124.26 for the Lifestyle category.

This indicates that the app follows a premium pricing
strategy and targets a niche market that may be
willing to pay a higher price for its offering.

Business Recommendation:

• Businesses should adopt premium pricing only when
  they provide high-quality features, excellent
  performance, and a clear value proposition.

• Developers should compare their pricing strategy
  with competitors before launching paid apps.

• Companies should ensure that higher prices are
  supported by strong customer value, positive user
  experience, and continuous product improvements.
==================================================
*/




/*
==================================================
Business Question 7

Question:
Which app is the highest-rated app in each category?

Business Value:
Identifying the highest-rated app in each category
helps businesses understand market leaders and learn
what contributes to customer satisfaction.
==================================================
*/

WITH RankedApps AS (
    SELECT
        Category,
        App,
        Rating,
        installs_clean,
        ROW_NUMBER() OVER(
            PARTITION BY Category
            ORDER BY Rating DESC, installs_clean DESC
        ) AS rank_num
    FROM googleplaystore_clean
    WHERE Rating IS NOT NULL
)

SELECT
    Category,
    App,
    Rating,
    installs_clean
FROM RankedApps
WHERE rank_num = 1
ORDER BY Rating DESC;



/*
==================================================
Business Insight:

Several categories have applications with a perfect
5.0 rating. However, many of these apps have relatively
low install counts, such as 100 installs.

This suggests that a high rating alone does not
necessarily indicate market success or widespread
adoption. Factors such as user reach and install volume
should also be considered when evaluating an app's
performance.

Business Recommendation:

• Businesses should evaluate both user ratings and
  install numbers before identifying market-leading
  applications.

• Developers should focus on improving app quality
  while also investing in marketing strategies to
  increase user adoption.

• Companies should benchmark successful applications
  based on multiple performance indicators rather
  than relying solely on ratings.
==================================================
*/





/*
==================================================
Business Question 8

Question:
Which categories have the highest number of paid apps?

Business Value:
Understanding which categories contain the most paid
applications helps businesses identify markets where
premium pricing is more common and accepted by users.
==================================================
*/

SELECT
    Category,
    COUNT(*) AS total_paid_apps,
    ROUND(AVG(price_clean),2) AS avg_price
FROM googleplaystore_clean
WHERE Type = 'Paid'
GROUP BY Category
ORDER BY total_paid_apps DESC;


/*
==================================================
Business Insight:

The Family category contains the highest
number of paid applications with total 191
paid apps.

This suggests that users in this category may be more
willing to purchase premium applications due to
high quility and efficiancy in this category.

The average price of paid apps in this category is
$12.75.

Business Recommendation:

• Businesses entering the Family category
  should evaluate whether a paid business model aligns
  with customer expectations.

• Developers should offer strong value through
  better services and information to justify
  premium pricing.

• Companies should balance pricing with customer
  satisfaction to remain competitive.
==================================================
*/



/*
==================================================
Business Question 9

Question:
Which paid apps have the highest number of installs?

Business Value:
Analyzing the most downloaded paid applications helps
businesses understand whether premium pricing can
coexist with strong market adoption.
==================================================
*/
SELECT
    App,
    Category,
    price_clean,
    installs_clean,
    Rating
FROM googleplaystore_clean
WHERE Type = 'Paid'
AND Rating IS NOT NULL
ORDER BY installs_clean DESC, Rating DESC
LIMIT 10;

/*
==================================================
Business Insight:

The app Hitman Sniper has the highest number of
installs among paid applications, with
10000000 downloads.

This demonstrates that users are willing to pay for
applications that provide a good entertainment and
efficinacy in the aap.

The app belongs to the game category
and has a rating of .4.6

Business Recommendation:

• Businesses should focus on delivering strong value
  and solving real user problems rather than competing
  on price alone.

• Developers should study successful paid apps to
  understand which features encourage users to make
  purchases.

• Companies should balance pricing, quality, and user
  satisfaction to increase long-term adoption.
==================================================
*/



/*
==================================================
Business Question 10

Question:
Which app categories provide the best business
opportunities based on user ratings, total installs,
and market competition?

Business Value:
Combining multiple performance indicators helps
businesses identify attractive markets with strong
customer demand, high satisfaction, and manageable
competition.
==================================================
*/

SELECT
    Category,
    COUNT(*) AS total_apps,
    ROUND(AVG(Rating),2) AS avg_rating,
    SUM(installs_clean) AS total_installs
FROM googleplaystore_clean
WHERE Rating IS NOT NULL
GROUP BY Category
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC,
         total_installs DESC,
         total_apps ASC;
         

/*
==================================================
Business Insight:

Based on ratings, installs, and the number of
applications, the Events category appears to provide
one of the strongest business opportunities.

The category has an average rating of 4.44,
total installs of 15,949,410, and only 45
applications.

This suggests that the Events category has strong
user demand and high customer satisfaction despite
having relatively fewer applications than many other
categories, indicating potential opportunities for
new developers.

Business Recommendation:

• Businesses should consider exploring the Events
  category after conducting detailed market research.

• Developers should focus on delivering innovative
  features and a high-quality user experience to
  compete successfully.

• Companies should continuously monitor customer
  feedback, market trends, and competitors before
  launching new applications.
==================================================
*/