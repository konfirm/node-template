/* global source, describe, it, expect */

describe('Contains the Sample module', () => {
	const Sample = source('sample');

	it('has the expected name', (next) => {
		expect(Sample.name).to.equal('node-project-template');

		next();
	});
});