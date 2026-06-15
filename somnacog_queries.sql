USE somnacog;

-- Which occupations average the most sleep, and how does that relate to their average cognitive score?
SELECT ss.total_sleep_hrs,
    ROUND(AVG(tr.score), 2) AS avg_cognitive_score
FROM sleep_sessions ss
JOIN test_results tr ON ss.subject_id = tr.subject_id
JOIN cognitive_tests ct ON tr.test_id = ct.test_id
WHERE ss.total_sleep_hrs < 6 OR ss.total_sleep_hrs > 7
GROUP BY ss.total_sleep_hrs
ORDER BY ss.total_sleep_hrs DESC;

-- Which sleep disorders are associated with the lowest average memory test scores?
SELECT sl.disorder_name,
    ROUND(AVG(tr.score), 2) AS avg_memory_score
FROM subjects s
JOIN subject_diagnoses sd ON s.subject_id = sd.subject_id
JOIN sleep_disorders sl ON sd.disorder_id = sl.disorder_id
JOIN test_results tr ON s.subject_id = tr.subject_id
JOIN cognitive_tests ct ON tr.test_id = ct.test_id
WHERE ct.cognitive_domain = 'Memory'
GROUP BY sl.disorder_name
ORDER BY avg_memory_score DESC;

-- Do subjects with higher average REM percentage score better on memory tests?
SELECT ss.subject_id,
    ROUND(AVG(ss.rem_pct), 2) AS avg_rem_pct,
    ROUND(AVG(tr.score), 2) AS avg_memory_score
FROM sleep_sessions ss
JOIN test_results tr ON ss.subject_id = tr.subject_id
JOIN cognitive_tests ct ON tr.test_id = ct.test_id
WHERE ct.cognitive_domain = 'Memory'
GROUP BY ss.subject_id
ORDER BY avg_rem_pct DESC;

-- Which occupations have the highest average stress, and does that predict worse sleep quality scores?
SELECT s.occupation,
    ROUND(AVG(s.stress_level), 2) AS avg_stress,
    ROUND(AVG(ss.sleep_quality_score), 2) AS avg_sleep_quality
FROM subjects s
JOIN sleep_sessions ss ON s.subject_id = ss.subject_id
GROUP BY s.occupation
ORDER BY avg_stress DESC;

-- Does higher caffeine intake correlate with reduced deep sleep percentage?
SELECT s.caffeine_mg,
    ROUND(AVG(ss.deep_sleep_pct), 2) AS avg_deep_sleep_pct
FROM subjects s
JOIN sleep_sessions ss ON s.subject_id = ss.subject_id
GROUP BY s.caffeine_mg
ORDER BY s.caffeine_mg DESC;

-- Which disorders appear most in older vs. younger subjects, and how do their cognitive scores compare?
SELECT sl.disorder_name,
    COUNT(DISTINCT sd.subject_id) AS num_diagnosed,
    ROUND(AVG(s.age), 2) AS avg_age,
    ROUND(AVG(tr.score), 2) AS avg_cognitive_score
FROM subjects s
JOIN subject_diagnoses sd ON s.subject_id = sd.subject_id
JOIN sleep_disorders sl ON sd.disorder_id = sl.disorder_id
JOIN test_results tr ON s.subject_id = tr.subject_id
GROUP BY sl.disorder_name
ORDER BY num_diagnosed DESC;

-- Do the top 10 subjects by average sleep efficiency also rank highest on cognitive scores?
SELECT s.subject_id, s.occupation,
    ROUND(AVG(ss.sleep_efficiency), 2) AS avg_sleep_efficiency,
    ROUND(AVG(tr.score), 2) AS avg_cognitive_score
FROM subjects s
JOIN sleep_sessions ss ON s.subject_id = ss.subject_id
JOIN test_results tr ON s.subject_id = tr.subject_id
GROUP BY s.subject_id, s.occupation
ORDER BY avg_sleep_efficiency DESC
LIMIT 10;

-- Does a higher number of nightly awakenings predict slower reaction time scores?
SELECT ss.awakenings,
    ROUND(AVG(tr.score), 2) AS avg_reaction_time
FROM sleep_sessions ss
JOIN test_results tr ON ss.subject_id = tr.subject_id
JOIN cognitive_tests ct ON tr.test_id = ct.test_id
WHERE ct.cognitive_domain = 'Reaction Time'
GROUP BY ss.awakenings
ORDER BY ss.awakenings;

