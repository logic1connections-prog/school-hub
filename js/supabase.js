import { createClient } from '@supabase/supabase-js';

// Initialize Supabase Client
const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY;

export const supabaseClient = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// Helper function to check if we are in mock mode
export function isMockMode() {
    return !supabaseClient;
}

/**
 * Registreert een nieuwe student en maakt direct een profiel aan.
 */
export async function signUp(email, password, name, className) {
    if (isMockMode()) return { data: null, error: null };

    const { data: authData, error: authError } = await supabaseClient.auth.signUp({
        email,
        password
    });

    if (authError) return { error: authError };
    if (!authData.user) return { error: new Error("Registratie mislukt") };

    const { error: profileError } = await supabaseClient
        .from('students')
        .insert([{
            id: authData.user.id,
            email: email,
            name: name,
            class: className
        }]);

    return { data: authData, error: profileError };
}

const MOCK_QUIZZES = [
    { id: 1, title: "Wiskunde: Hoofdrekenen", category: "Wiskunde", question_count: 10 }
    // ... rest of mock data can be externalized or kept here
];

export async function getQuizzes(category = null, limit = 50) {
    if (isMockMode()) {
        await new Promise(resolve => setTimeout(resolve, 500));
        let data = MOCK_QUIZZES;
        if (category) data = data.filter(q => q.category === category);
        return { data: data.slice(0, limit), error: null };
    }

    let query = supabaseClient
        .from('quizzes')
        .select(`
            *,
            question_count:questions(count)
        `)
        .limit(limit);

    if (category) {
        query = query.eq('category', category);
    }

    const { data, error } = await query;
    if (data) {
        data.forEach(q => {
            if (q.question_count && Array.isArray(q.question_count)) {
                q.question_count = q.question_count[0]?.count || 0;
            }
        });
    }
    return { data, error };
}

export async function getQuizQuestions(quizId) {
    if (isMockMode()) {
        return {
            data: [
                { id: 1, question: "Wat is 10 + 10?", options: ["10", "20", "30", "40"], correct_index: 1 }
            ],
            error: null
        };
    }

    return await supabaseClient
        .from('questions')
        .select('*')
        .eq('quiz_id', quizId)
        .order('id', { ascending: true });
}

export async function createQuiz(title, description, category, level = 1) {
    if (isMockMode()) return { data: null, error: null };
    return await supabaseClient
        .from('quizzes')
        .insert([{ title, description, category, level }])
        .select();
}

export async function addQuestion(quizId, question, options, correctIndex, imageUrl = null) {
    if (isMockMode()) return { data: null, error: null };
    return await supabaseClient
        .from('questions')
        .insert([{ quiz_id: quizId, question, options, correct_index: correctIndex, image_url: imageUrl }]);
}

export async function saveQuizQuestions(quizId, questionsArray) {
    if (isMockMode()) return { data: null, error: null };

    const { data: existing, error: fetchError } = await supabaseClient
        .from('questions')
        .select('question')
        .eq('quiz_id', quizId);

    if (fetchError) return { data: null, error: fetchError };

    const existingTexts = new Set((existing || []).map(q => q.question.toLowerCase()));
    const newQuestions = questionsArray.filter(q => !existingTexts.has(q.question.toLowerCase()));

    if (newQuestions.length === 0) throw new Error('Alle vragen bestaan al!');

    const questionsToInsert = newQuestions.map(q => ({
        quiz_id: quizId,
        question: q.question,
        options: q.options,
        correct_index: q.correct_index,
        image_url: q.image_url || null
    }));

    return await supabaseClient.from('questions').insert(questionsToInsert);
}

export async function deleteQuiz(id) {
    if (isMockMode()) return { data: null, error: null };
    return await supabaseClient.from('quizzes').delete().eq('id', id);
}

export async function saveQuizScore(studentId, quizId, score, passed) {
    if (isMockMode()) return { data: null, error: null };
    return await supabaseClient
        .from('student_progress')
        .upsert([{ student_id: studentId, quiz_id: quizId, score, passed }], { onConflict: 'student_id,quiz_id' });
}

export async function getStudentProgress(studentId) {
    if (isMockMode()) return { data: [], error: null };
    return await supabaseClient
        .from('student_progress')
        .select('quiz_id, score, passed')
        .eq('student_id', studentId);
}

export async function createChallenge(challengerId, challengedId, quizId) {
    if (isMockMode()) return { data: null, error: null };
    return await supabaseClient
        .from('challenges')
        .insert([{ challenger_id: challengerId, challenged_id: challengedId, quiz_id: quizId, status: 'pending' }]);
}

export async function getChallenges(studentId) {
    if (isMockMode()) return { data: [], error: null };
    return await supabaseClient
        .from('challenges')
        .select('*, challenger:students!challenger_id(name), challenged:students!challenged_id(name), quiz:quizzes(title)')
        .or(`challenger_id.eq.${studentId},challenged_id.eq.${studentId}`)
        .order('created_at', { ascending: false });
}

export async function saveStudentAnswer(questionId, selectedIndex) {
    if (isMockMode()) return { data: null, error: null };
    return await supabaseClient
        .from('student_answers')
        .insert([{ question_id: questionId, selected: selectedIndex }]);
}

export async function syncOfflineAnswers(answers) {
    if (isMockMode() || !answers || answers.length === 0) return { data: null, error: null };
    return await supabaseClient
        .from('student_answers')
        .insert(answers.map(a => ({
            question_id: a.questionId,
            selected: a.selectedIndex,
            created_at: a.timestamp
        })));
}

export async function getQuizAnalytics() {
    if (isMockMode()) return { data: {}, error: null };
    return await supabaseClient.rpc('get_quiz_stats');
}

export async function updateChallenge(challengeId, updates) {
    if (isMockMode()) return { data: null, error: null };
    return await supabaseClient.from('challenges').update(updates).eq('id', challengeId);
}

// Machine Passport Functions
export async function getMachines() {
    if (isMockMode()) return { data: [], error: null };
    return await supabaseClient.from('machines').select('*').order('name');
}

export async function getMachineCertificates(studentId) {
    if (isMockMode()) return { data: [], error: null };
    return await supabaseClient
        .from('machine_certificates')
        .select('*, machine:machines(*)')
        .eq('student_id', studentId);
}

export async function awardCertificate(studentId, machineId, status = 'certified') {
    if (isMockMode()) return { data: null, error: null };
    return await supabaseClient
        .from('machine_certificates')
        .upsert([{
            student_id: studentId,
            machine_id: machineId,
            status,
            issued_at: new Date().toISOString()
        }], { onConflict: 'student_id,machine_id' });
}

export function showError(message, context = 'general') {
    const errorDiv = document.createElement('div');
    errorDiv.className = 'glass-panel card error-card fade-in-up';
    errorDiv.style.position = 'fixed';
    errorDiv.style.top = '2rem';
    errorDiv.style.right = '2rem';
    errorDiv.style.zIndex = '1000';
    errorDiv.style.maxWidth = '400px';
    errorDiv.style.borderLeft = '4px solid #ef4444';

    errorDiv.innerHTML = `
        <div style="display: flex; justify-content: space-between; align-items: flex-start; gap: 1rem;">
            <div>
                <h3 style="margin: 0; color: #ef4444;">⚠️ Oeps!</h3>
                <p style="margin: 0.5rem 0 0; font-size: 0.9rem;">${message}</p>
            </div>
            <button onclick="this.closest('.error-card').remove()" class="btn" style="padding: 0.2rem 0.5rem; background: rgba(255,255,255,0.1);">&times;</button>
        </div>
    `;
    document.body.appendChild(errorDiv);
    setTimeout(() => { if (errorDiv.parentElement) errorDiv.remove(); }, 5000);
}
