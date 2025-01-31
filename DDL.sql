--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Claims and Payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Claims and Payments" (
    claim_id integer NOT NULL,
    patient_id integer,
    provider_id integer,
    "Service_ID" integer,
    "Date" timestamp without time zone,
    "Billed Amount" integer,
    "Paid Amount" integer,
    "Payment Type" character varying
);


ALTER TABLE public."Claims and Payments" OWNER TO postgres;

--
-- Name: Feedback and Complaints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Feedback and Complaints" (
    "Feedback_ID" integer NOT NULL,
    patient_id integer,
    provider_id integer,
    "Date" timestamp without time zone,
    "Cost Concerns" character varying,
    "Service Feedback" character varying,
    rating integer
);


ALTER TABLE public."Feedback and Complaints" OWNER TO postgres;

--
-- Name: Financial Assistance Programs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Financial Assistance Programs" (
    "Program_id" integer NOT NULL,
    financial_assistance_name character varying,
    "Eligibility Criteria" character varying,
    "Maximum Aid Amount" integer
);


ALTER TABLE public."Financial Assistance Programs" OWNER TO postgres;

--
-- Name: Financial_Assistance_Program_Enrollment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Financial_Assistance_Program_Enrollment" (
    "Enrollment_id" integer NOT NULL,
    patient_id integer,
    "Program_id" integer,
    "Application_date" date,
    "Approval_Status" character varying
);


ALTER TABLE public."Financial_Assistance_Program_Enrollment" OWNER TO postgres;

--
-- Name: Healthcare Providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Healthcare Providers" (
    provider_id integer NOT NULL,
    provider_name character varying(200),
    city character varying(50),
    state character varying(50),
    specialty character varying(50),
    "Average Treatment Costs" integer
);


ALTER TABLE public."Healthcare Providers" OWNER TO postgres;

--
-- Name: Insurance Plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Insurance Plans" (
    "Plan_id" integer NOT NULL,
    insurance_provider_name character varying(200),
    "Coverage Percentage" integer,
    "Premium" integer,
    "Deductibles" integer,
    "Exclusions" character varying
);


ALTER TABLE public."Insurance Plans" OWNER TO postgres;

--
-- Name: Patient_Insurance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Patient_Insurance" (
    patient_id integer,
    "Plan_id" integer,
    "Enrollment_date" timestamp without time zone,
    "Status" character varying,
    "Patient_Insurance_id" integer NOT NULL
);


ALTER TABLE public."Patient_Insurance" OWNER TO postgres;

--
-- Name: Patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Patients" (
    patient_id integer NOT NULL,
    "Name" character varying(50),
    "Age" integer,
    "Contact" character varying(30),
    "Income Level" character varying(10),
    "Insurance Status" character varying(10),
    "Medical History" character varying(200)
);


ALTER TABLE public."Patients" OWNER TO postgres;

--
-- Name: Services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Services" (
    "Service_ID" integer NOT NULL,
    "Service_Name" character varying,
    "Category" character varying,
    "Cost" integer,
    provider_id integer
);


ALTER TABLE public."Services" OWNER TO postgres;

--
-- Name: Claims and Payments Claims and Payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Claims and Payments"
    ADD CONSTRAINT "Claims and Payments_pkey" PRIMARY KEY (claim_id);


--
-- Name: Feedback and Complaints Feedback and Complaints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Feedback and Complaints"
    ADD CONSTRAINT "Feedback and Complaints_pkey" PRIMARY KEY ("Feedback_ID");


--
-- Name: Financial Assistance Programs Financial Assistance Programs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Financial Assistance Programs"
    ADD CONSTRAINT "Financial Assistance Programs_pkey" PRIMARY KEY ("Program_id");


--
-- Name: Financial_Assistance_Program_Enrollment Financial_Assistance_Program_Enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Financial_Assistance_Program_Enrollment"
    ADD CONSTRAINT "Financial_Assistance_Program_Enrollment_pkey" PRIMARY KEY ("Enrollment_id");


--
-- Name: Healthcare Providers Healthcare Providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Healthcare Providers"
    ADD CONSTRAINT "Healthcare Providers_pkey" PRIMARY KEY (provider_id);


--
-- Name: Insurance Plans Insurance Plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Insurance Plans"
    ADD CONSTRAINT "Insurance Plans_pkey" PRIMARY KEY ("Plan_id");


--
-- Name: Patient_Insurance Patient_Insurance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_Insurance"
    ADD CONSTRAINT "Patient_Insurance_pkey" PRIMARY KEY ("Patient_Insurance_id");


--
-- Name: Patients Patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_pkey" PRIMARY KEY (patient_id);


--
-- Name: Services Services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_pkey" PRIMARY KEY ("Service_ID");


--
-- Name: idx_claims; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_claims ON public."Claims and Payments" USING btree ("Date", "Billed Amount", "Paid Amount", "Payment Type");


--
-- Name: idx_fap_enrollment; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fap_enrollment ON public."Financial_Assistance_Program_Enrollment" USING btree ("Application_date", "Approval_Status");


--
-- Name: idx_feedback; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_feedback ON public."Feedback and Complaints" USING btree ("Date", "Cost Concerns", "Service Feedback", rating);


--
-- Name: idx_financial_programs; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_financial_programs ON public."Financial Assistance Programs" USING btree (financial_assistance_name, "Eligibility Criteria", "Maximum Aid Amount");


--
-- Name: idx_healthcare_providers; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_healthcare_providers ON public."Healthcare Providers" USING btree (provider_name, city, state, specialty, "Average Treatment Costs");


--
-- Name: idx_insurance_plans; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_insurance_plans ON public."Insurance Plans" USING btree (insurance_provider_name, "Coverage Percentage", "Premium", "Deductibles", "Exclusions");


--
-- Name: idx_patient_insurance; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_patient_insurance ON public."Patient_Insurance" USING btree ("Enrollment_date", "Status");


--
-- Name: idx_patients; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_patients ON public."Patients" USING btree ("Name", "Age", "Contact", "Income Level", "Insurance Status", "Medical History");


--
-- Name: idx_services; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_services ON public."Services" USING btree ("Service_Name", "Category", "Cost");


--
-- Name: Claims and Payments Claims and Payments_Service_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Claims and Payments"
    ADD CONSTRAINT "Claims and Payments_Service_ID_fkey" FOREIGN KEY ("Service_ID") REFERENCES public."Services"("Service_ID");


--
-- Name: Claims and Payments Claims and Payments_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Claims and Payments"
    ADD CONSTRAINT "Claims and Payments_patient_id_fkey" FOREIGN KEY (patient_id) REFERENCES public."Patients"(patient_id);


--
-- Name: Claims and Payments Claims and Payments_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Claims and Payments"
    ADD CONSTRAINT "Claims and Payments_provider_id_fkey" FOREIGN KEY (provider_id) REFERENCES public."Healthcare Providers"(provider_id);


--
-- Name: Feedback and Complaints Feedback and Complaints_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Feedback and Complaints"
    ADD CONSTRAINT "Feedback and Complaints_patient_id_fkey" FOREIGN KEY (patient_id) REFERENCES public."Patients"(patient_id);


--
-- Name: Feedback and Complaints Feedback and Complaints_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Feedback and Complaints"
    ADD CONSTRAINT "Feedback and Complaints_provider_id_fkey" FOREIGN KEY (provider_id) REFERENCES public."Healthcare Providers"(provider_id);


--
-- Name: Financial_Assistance_Program_Enrollment Financial_Assistance_Program_Enrollment_Program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Financial_Assistance_Program_Enrollment"
    ADD CONSTRAINT "Financial_Assistance_Program_Enrollment_Program_id_fkey" FOREIGN KEY ("Program_id") REFERENCES public."Financial Assistance Programs"("Program_id");


--
-- Name: Financial_Assistance_Program_Enrollment Financial_Assistance_Program_Enrollment_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Financial_Assistance_Program_Enrollment"
    ADD CONSTRAINT "Financial_Assistance_Program_Enrollment_patient_id_fkey" FOREIGN KEY (patient_id) REFERENCES public."Patients"(patient_id);


--
-- Name: Patient_Insurance Patient_Insurance_Plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_Insurance"
    ADD CONSTRAINT "Patient_Insurance_Plan_id_fkey" FOREIGN KEY ("Plan_id") REFERENCES public."Insurance Plans"("Plan_id");


--
-- Name: Patient_Insurance Patient_Insurance_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_Insurance"
    ADD CONSTRAINT "Patient_Insurance_patient_id_fkey" FOREIGN KEY (patient_id) REFERENCES public."Patients"(patient_id);


--
-- Name: Services Services_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_provider_id_fkey" FOREIGN KEY (provider_id) REFERENCES public."Healthcare Providers"(provider_id);


--
-- PostgreSQL database dump complete
--

