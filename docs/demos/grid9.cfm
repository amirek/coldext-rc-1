<cfimport prefix="ext" taglib="/coldext">
<cfimport prefix="ux" taglib="/coldext/ux">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="grid9-out" class="output"></div>

<!--- custom style for the cost column --->
<style type="text/css">
.x-grid3-body .x-grid3-td-cost {
    background-color:#f1f2f4;
}
.x-grid3-summary-row .x-grid3-td-cost {
    background-color:#e1e2e4;
}
</style>

<ext:onReady>

	<ext:createChild tag="h2" renderTo="grid9-out">Group Summary and Grid Resizer extensions</ext:createChild>

	<ext:script>
		dummyData = [
		    {projectId: 100, project: 'Ext Forms: Field Anchoring', taskId: 112, description: 'Integrate 2.0 Forms with 2.0 Layouts', estimate: 6, rate: 150, due:'06/24/2007'},
		    {projectId: 100, project: 'Ext Forms: Field Anchoring', taskId: 113, description: 'Implement AnchorLayout', estimate: 4, rate: 150, due:'06/25/2007'},
		    {projectId: 100, project: 'Ext Forms: Field Anchoring', taskId: 114, description: 'Add support for multiple types of anchors', estimate: 4, rate: 150, due:'06/27/2007'},
		    {projectId: 100, project: 'Ext Forms: Field Anchoring', taskId: 115, description: 'Testing and debugging', estimate: 8, rate: 0, due:'06/29/2007'},
		    {projectId: 101, project: 'Ext Grid: Single-level Grouping', taskId: 101, description: 'Add required rendering "hooks" to GridView', estimate: 6, rate: 100, due:'07/01/2007'},
		    {projectId: 101, project: 'Ext Grid: Single-level Grouping', taskId: 102, description: 'Extend GridView and override rendering functions', estimate: 6, rate: 100, due:'07/03/2007'},
		    {projectId: 101, project: 'Ext Grid: Single-level Grouping', taskId: 103, description: 'Extend Store with grouping functionality', estimate: 4, rate: 100, due:'07/04/2007'},
		    {projectId: 101, project: 'Ext Grid: Single-level Grouping', taskId: 121, description: 'Default CSS Styling', estimate: 2, rate: 100, due:'07/05/2007'},
		    {projectId: 101, project: 'Ext Grid: Single-level Grouping', taskId: 104, description: 'Testing and debugging', estimate: 6, rate: 100, due:'07/06/2007'},
		    {projectId: 102, project: 'Ext Grid: Summary Rows', taskId: 105, description: 'Ext Grid plugin integration', estimate: 4, rate: 125, due:'07/01/2007'},
		    {projectId: 102, project: 'Ext Grid: Summary Rows', taskId: 106, description: 'Summary creation during rendering phase', estimate: 4, rate: 125, due:'07/02/2007'},
		    {projectId: 102, project: 'Ext Grid: Summary Rows', taskId: 107, description: 'Dynamic summary updates in editor grids', estimate: 6, rate: 125, due:'07/05/2007'},
		    {projectId: 102, project: 'Ext Grid: Summary Rows', taskId: 108, description: 'Remote summary integration', estimate: 4, rate: 125, due:'07/05/2007'},
		    {projectId: 102, project: 'Ext Grid: Summary Rows', taskId: 109, description: 'Summary renderers and calculators', estimate: 4, rate: 125, due:'07/06/2007'},
		    {projectId: 102, project: 'Ext Grid: Summary Rows', taskId: 110, description: 'Integrate summaries with GroupingView', estimate: 10, rate: 125, due:'07/11/2007'},
		    {projectId: 102, project: 'Ext Grid: Summary Rows', taskId: 111, description: 'Testing and debugging', estimate: 8, rate: 125, due:'07/15/2007'}
		];
	</ext:script>

	<ext:groupingStore var="myGroupedStore" autoLoad="true" data="dummyData"
				groupField="project" sortInfo="{ field: 'due', direction: 'ASC' }">
		<ext:jsonReader>
			<ext:field name="projectId" type="int" />
			<ext:field name="project" type="string" />
			<ext:field name="taskId" type="int" />
			<ext:field name="description" type="string" />
			<ext:field name="estimate" type="float" />
			<ext:field name="rate" type="float" />
			<ext:field name="cost" type="float" />
			<ext:field name="due" type="date" dateFormat="m/d/Y" />
		</ext:jsonReader>
	</ext:groupingStore>

	<ext:script>
		// renderers
		function renderHours (v) {
			return v +' hours';
		}
		function renderCost (v, params, record) {
			return Ext.util.Format.usMoney(record.data.estimate * record.data.rate);
		}

		// custom summary type
		Ext.grid.GroupSummary.Calculations['totalCost'] = function(v, record, field){
			return v + (record.data.estimate * record.data.rate);
		}

		// summary renderers
		function summaryDescription (v, params, data) {
			return ((v === 0 || v > 1) ? '(' + v +' Tasks)' : '(1 Task)');
		}
	</ext:script>

	<!---
		The gridGroupSummary extension works with two attributes on the gridColumn:
		 - summaryRenderer is a custom renderer function for the summary of that column
		 - summaryType is the type of operation to perform on the values in the column
		   e.g. average, count, max, min, sum
	 --->
	<ux:gridGroupSummary var="mySummary">

	<!--- The gridPanelResizer adds a resizing grip to the bottom of the grid panel --->
	<ux:gridPanelResizer var="myResizer" minHeight="250">

	<ext:editorGridPanel renderTo="grid9-out" plugins="[mySummary,myResizer]" title="Grouped JSON Grid" frame="true"
				clicksToEdit="1" width="680" height="365" stripeRows="true" store="myGroupedStore">
		<ext:gridColumn header="Description" width="80" sortable="true" dataIndex="description" summaryRenderer="summaryDescription" summaryType="count">
			<ext:input required="true">
		</ext:gridColumn>
		<ext:gridColumn header="Project" width="20" sortable="true" dataIndex="project" />
		<ext:gridColumn header="Due Date" width="25" sortable="true" dataIndex="due" renderer="Ext.util.Format.dateRenderer('m/d/Y')" summaryType="max">
			<ext:dateField format="m/d/Y" allowBlank="false">
		</ext:gridColumn>
		<ext:gridColumn header="Estimate" width="25" sortable="true" dataIndex="estimate" renderer="renderHours" summaryType="sum">
			<ext:numberField allowBlank="false" style="text-align: left">
		</ext:gridColumn>
		<ext:gridColumn header="Rate" width="20" sortable="true" dataIndex="rate" renderer="Ext.util.Format.usMoney" summaryType="average">
			<ext:numberField allowBlank="false" style="text-align: left">
		</ext:gridColumn>
		<ext:gridColumn id="cost" header="Cost" width="20" dataIndex="cost" renderer="renderCost" summaryRenderer="Ext.util.Format.usMoney" summaryType="totalCost" />
		<ext:groupingView enableNoGroups="false" forcefit="true" showGroupName="false" hideGroupedColumn="true" />
	</ext:editorGridPanel>

</ext:onReady>