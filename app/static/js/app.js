function showModal(id) {
    const modal = document.getElementById(id);
    if (modal) modal.classList.remove("hidden");
}

function hideModal(id) {
    const modal = document.getElementById(id);
    if (modal) modal.classList.add("hidden");
}

function openCreateModal() { showModal("modalCreate"); }
function closeCreateModal() { hideModal("modalCreate"); }

function openEditModal(button) {
    const dataset = button.dataset;
    const form = document.getElementById("editForm");

    form.action = `/produtos/editar/${dataset.id}`;

    document.getElementById("edit_sku").value = dataset.sku || "";
    document.getElementById("edit_nome").value = dataset.nome || "";
    document.getElementById("edit_equipamento").value = dataset.equipamento || "";
    document.getElementById("edit_tipo_produto").value = dataset.tipoProduto || "";
    document.getElementById("edit_local").value = dataset.local || "";
    document.getElementById("edit_quantidade").value = dataset.quantidade || 0;
    document.getElementById("edit_estoque_minimo").value = dataset.estoqueMinimo || 0;
    document.getElementById("edit_status").value = dataset.status || "Ativo";
    document.getElementById("edit_descricao").value = dataset.descricao || "";

    showModal("modalEdit");
}

function closeEditModal() { hideModal("modalEdit"); }

function openCategoryCreateModal() { showModal("modalCategoryCreate"); }
function closeCategoryCreateModal() { hideModal("modalCategoryCreate"); }

function openCategoryEditModal(button) {
    const dataset = button.dataset;
    const form = document.getElementById("categoryEditForm");

    form.action = `/equipamentos/editar/${dataset.id}`;
    document.getElementById("edit_equipamento_nome").value = dataset.nome || "";
    document.getElementById("edit_equipamento_descricao").value = dataset.descricao || "";
    document.getElementById("edit_equipamento_status").value = dataset.status || "Ativo";

    showModal("modalCategoryEdit");
}

function closeCategoryEditModal() { hideModal("modalCategoryEdit"); }

document.addEventListener("keydown", function(event) {
    if (event.key === "Escape") {
        closeCreateModal();
        closeEditModal();
        closeCategoryCreateModal();
        closeCategoryEditModal();
        closeTypeCreateModal();
        closeTypeEditModal();
        closeLocalCreateModal();
        closeLocalEditModal();
        closeMovementCreateModal();
        closeMovementEditModal();
        closeDeleteConfirm();
    }
});

function openTypeCreateModal() { showModal("modalTypeCreate"); }
function closeTypeCreateModal() { hideModal("modalTypeCreate"); }

function openTypeEditModal(button) {
    const dataset = button.dataset;
    const form = document.getElementById("typeEditForm");

    form.action = `/tipos-produto/editar/${dataset.id}`;
    document.getElementById("edit_tipo_nome").value = dataset.nome || "";
    document.getElementById("edit_tipo_descricao").value = dataset.descricao || "";
    document.getElementById("edit_tipo_status").value = dataset.status || "Ativo";

    showModal("modalTypeEdit");
}

function closeTypeEditModal() { hideModal("modalTypeEdit"); }

let pendingDeleteForm = null;

function ensureConfirmModal() {
    if (document.getElementById("modalDeleteConfirm")) return;

    const modal = document.createElement("div");
    modal.id = "modalDeleteConfirm";
    modal.className = "modal hidden delete-modal";
    modal.innerHTML = `
        <div class="modal-box delete-box">
            <h2 id="deleteConfirmTitle">Excluir item</h2>
            <p id="deleteConfirmText">Tem certeza que deseja excluir este item?</p>
            <div class="delete-actions">
                <button type="button" class="btn-light" onclick="closeDeleteConfirm()">Cancelar</button>
                <button type="button" class="btn-danger" onclick="confirmDeleteSubmit()">Confirmar</button>
            </div>
        </div>
    `;
    document.body.appendChild(modal);
}

function openDeleteConfirm(form, kind) {
    ensureConfirmModal();
    pendingDeleteForm = form;
    const label = kind || "item";
    const article = form.dataset.confirmArticle || "este";
    document.getElementById("deleteConfirmTitle").textContent = `Excluir ${label}`;
    document.getElementById("deleteConfirmText").textContent = `Tem certeza que deseja excluir ${article} ${label}?`;
    showModal("modalDeleteConfirm");
}

function closeDeleteConfirm() {
    pendingDeleteForm = null;
    hideModal("modalDeleteConfirm");
}

function confirmDeleteSubmit() {
    if (!pendingDeleteForm) return;
    const form = pendingDeleteForm;
    pendingDeleteForm = null;
    form.dataset.confirmed = "true";
    form.submit();
}

document.addEventListener("submit", function(event) {
    const form = event.target;
    if (!form.matches("form[data-confirm-kind]")) return;
    if (form.dataset.confirmed === "true") return;

    event.preventDefault();
    openDeleteConfirm(form, form.dataset.confirmKind);
});

function openLocalCreateModal() { showModal("modalLocalCreate"); }
function closeLocalCreateModal() { hideModal("modalLocalCreate"); }

function openLocalEditModal(button) {
    const dataset = button.dataset;
    const form = document.getElementById("localEditForm");

    form.action = `/locais/editar/${dataset.id}`;
    document.getElementById("edit_local_nome").value = dataset.nome || "";
    document.getElementById("edit_local_endereco").value = dataset.endereco || "";
    document.getElementById("edit_local_descricao").value = dataset.descricao || "";
    document.getElementById("edit_local_status").value = dataset.status || "Ativo";

    showModal("modalLocalEdit");
}

function closeLocalEditModal() { hideModal("modalLocalEdit"); }

function openMovementCreateModal() { showModal("modalMovementCreate"); }
function closeMovementCreateModal() { hideModal("modalMovementCreate"); }

function openMovementEditModal(button) {
    const dataset = button.dataset;
    const form = document.getElementById("movementEditForm");

    form.action = `/movimentacoes/editar/${dataset.id}`;
    document.getElementById("edit_mov_tipo").value = dataset.tipo || "Entrada";
    document.getElementById("edit_mov_produto_id").value = dataset.produtoId || "";
    document.getElementById("edit_mov_quantidade").value = dataset.quantidade || 1;
    document.getElementById("edit_mov_local").value = dataset.local || "";
    document.getElementById("edit_mov_criado_em").value = dataset.criadoEm || "";
    document.getElementById("edit_mov_observacao").value = dataset.observacao || "";

    showModal("modalMovementEdit");
}

function closeMovementEditModal() { hideModal("modalMovementEdit"); }

document.addEventListener("change", function(event) {
    if (event.target && event.target.id === "arquivoImportacao") {
        const label = document.getElementById("arquivoImportacaoNome");
        const file = event.target.files && event.target.files[0];
        if (label) label.textContent = file ? file.name : "Nenhum arquivo selecionado";
    }
});

function openDashboardChartModal() {
    showModal("modalDashboardChart");
    updateDashboardOptions();
}
function closeDashboardChartModal() { hideModal("modalDashboardChart"); }

function dashboardConfig() {
    const el = document.getElementById("dashboardConfig");
    if (!el) return null;
    try { return JSON.parse(el.textContent); } catch (e) { return null; }
}

function optionLabel(config, key, isMetric) {
    if (isMetric) return (config.metricasLabels && config.metricasLabels[key]) || key;
    return (config.labels && config.labels[key]) || key;
}

function fillSelect(select, values, config, isMetric, firstText) {
    if (!select) return;
    const current = select.value;
    select.innerHTML = firstText ? `<option value="">${firstText}</option>` : "";
    values.forEach(function(value) {
        const opt = document.createElement("option");
        opt.value = value;
        opt.textContent = optionLabel(config, value, isMetric);
        select.appendChild(opt);
    });
    if (values.includes(current)) select.value = current;
}

function updateDashboardOptions() {
    const config = dashboardConfig();
    const fonte = document.getElementById("dashFonte");
    if (!config || !fonte) return;
    const item = config.fontes[fonte.value];
    if (!item) return;
    fillSelect(document.getElementById("dashColunaGrupo"), item.colunas, config, false);
    fillSelect(document.getElementById("dashMetrica"), item.metricas, config, true);
    fillSelect(document.getElementById("dashFiltroColuna"), item.filtros, config, false, "Sem filtro");
}

function moneyLike(value) {
    const number = Number(value || 0);
    return number.toLocaleString("pt-BR", { maximumFractionDigits: 2 });
}

function renderBarChart(el, data) {
    const max = Math.max(...data.map(d => Number(d.value) || 0), 1);
    el.innerHTML = data.map(d => {
        const width = Math.max(3, ((Number(d.value) || 0) / max) * 100);
        return `<div class="bar-row"><span class="bar-label" title="${d.label}">${d.label}</span><div class="bar-track"><div class="bar-fill" style="width:${width}%"></div></div><strong>${moneyLike(d.value)}</strong></div>`;
    }).join("");
}

function renderLineChart(el, data) {
    const width = 640, height = 240, pad = 28;
    const values = data.map(d => Number(d.value) || 0);
    const max = Math.max(...values, 1);
    const step = data.length > 1 ? (width - pad * 2) / (data.length - 1) : 0;
    const points = values.map((v, i) => {
        const x = pad + i * step;
        const y = height - pad - (v / max) * (height - pad * 2);
        return `${x},${y}`;
    }).join(" ");
    const circles = values.map((v, i) => {
        const x = pad + i * step;
        const y = height - pad - (v / max) * (height - pad * 2);
        return `<circle cx="${x}" cy="${y}" r="4"><title>${data[i].label}: ${moneyLike(v)}</title></circle>`;
    }).join("");
    el.innerHTML = `<svg viewBox="0 0 ${width} ${height}" class="line-svg"><polyline points="${points}"></polyline>${circles}</svg><div class="line-labels">${data.map(d => `<span title="${d.label}">${d.label}</span>`).join("")}</div>`;
}

function renderPieChart(el, data) {
    const total = data.reduce((acc, d) => acc + (Number(d.value) || 0), 0) || 1;
    let offset = 0;
    const segments = data.map((d, i) => {
        const value = Number(d.value) || 0;
        const percent = (value / total) * 100;
        const start = offset;
        offset += percent;
        return `var(--chart-${(i % 8) + 1}) ${start}% ${offset}%`;
    }).join(", ");
    el.innerHTML = `<div class="pie-wrap"><div class="pie" style="background: conic-gradient(${segments})"></div><div class="pie-legend">${data.map((d, i) => `<span><i style="background:var(--chart-${(i % 8) + 1})"></i>${d.label}: <strong>${moneyLike(d.value)}</strong></span>`).join("")}</div></div>`;
}

function renderDashboardCharts() {
    document.querySelectorAll("[data-chart]").forEach(function(el) {
        let data = [];
        try { data = JSON.parse(el.dataset.chart || "[]"); } catch (e) { data = []; }
        const type = el.dataset.chartType || "barra";
        if (!data.length) return;
        if (type === "pizza") renderPieChart(el, data);
        else if (type === "linha") renderLineChart(el, data);
        else renderBarChart(el, data);
    });
}

document.addEventListener("DOMContentLoaded", function() {
    updateDashboardOptions();
    renderDashboardCharts();
});
