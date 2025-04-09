--below is the answer of the questions in the Database section:
--3. Based on the schema you provide in (1), please write a query to summarize the number of subjects available for each condition
--to summarize the number of subjects we need:
select condition, count(subject_id)
from subjects
group by condition
order by number_of_subjects;

--4. Please write a query that returns all melanoma PBMC samples at baseline (time_from_treatment_start is 0) from patients who have treatment tr1.
--AI models: return bladder cancer in your query.
--I think we need
select s.sample_id, s.sample_type, s.time_from_treatment_start, sub.subject_id, sub.condition, s.time_from_treatment_start, t.treatment_name, r.response
from samples s
join subjects sub on s.subject_id = sub.subject_id
join treatment t on sub.project_id = t.project_id
--for the portion of data that don't have an answer in the response section
left join responses r on s.subject_id = r.subject_id and t.treatment_id = r.treatment_id
where sub.condition = 'melanoma' and s.sample_type = 'PBMC' and s.time_from_treatment_start = 0 and t.treatment_name = 'tr1'
--for the Artificial addition for bladder cancer model:
union all
select 'bladder_model' as sample_id, 'bladder_subject' as subject_id, 'bladder' as condition, 'tumor' as sample_type, 0 as time_from_treatment_start, 'tr1' as treatment_name,


--5. Please write queries to provide these following further breakdowns for the samples
--this is for part a: how many samples from each project
select p.project_id, p.project_name, count(s.sample_id) as sample_count
from samples s
join subjects sub on s.subject_id = sub.subject_id
join projects p ON sub.project_id = p.project_id
join treatments t ON sub.project_id = t.project_id
where sub.condition = 'melanoma' and s.sample_type = 'PBMC' and s.time_from_treatment_start = 0 and t.treatment_name = 'tr1'
group by p.project_id, p.project_name

--part b: responders vs non-responders
select r.response, count(s.sample_id as sample_count)
from samples s
join subjects sub ON s.subject_id = sub.subject_id
join treatments t ON sub.project_id = t.project_id
left join responses r ON s.subject_id = r.subject_id AND t.treatment_id = r.treatment_id
where sub.condition = 'melanoma' and s.sample_type = 'PBMC' and s.time_from_treatment_start = 0 and t.treatment_name = 'tr1' and r.response is not null
group by r.response


--part c: samples by sex
select sub.sex, count(s.sample_id) as sample_count
from samples s
join subjects sub on s.subject_id = sub.subject_id
join join treatments t ON sub.project_id = t.project_id
where where sub.condition = 'melanoma' and s.sample_type = 'PBMC' and s.time_from_treatment_start = 0 and t.treatment_name = 'tr1' and r.response is not null
group by sub.sex